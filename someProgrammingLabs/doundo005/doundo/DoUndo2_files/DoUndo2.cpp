#include "stdafx.h"	//��� ������� � ����� VC++6 � �������������� ������������������ ������. ����� - ����������

//----------

#include "DoUndo2.h"

//�����������
CDoUndo2::CDoUndo2(int UNDO_size,int DO_size)
{
	SetStacksSizez(UNDO_size,DO_size);
}

//����������
CDoUndo2::~CDoUndo2()
{
	DeleteAllStacks();
}

//������ ������� ������. ���������� ���������� ������ ���������
bool CDoUndo2::SetStacksSizez(int UNDO_size,int DO_size)
{
	DeleteAllStacks();

	//������� �������� ������ UNDO � DO
	UNDO_size	=max(e_minStSize,min(e_maxStSize,UNDO_size	));
	DO_size		=max(e_minStSize,min(e_maxStSize,DO_size	));

	//������ �����
	m_UndoStack.NewStack(UNDO_size);
	m_DoStack.	NewStack(DO_size);

	if(m_UndoStack.IsValid() && m_DoStack.IsValid())
	{
		return true;
	}

	//���� �� ����� )
	DeleteAllStacks();
	return false;
}

void CDoUndo2::DeleteAllStacks()
{
	//������� �����
	m_UndoStack.DeleteStack();
	m_DoStack.DeleteStack();
}


//���������� �������� � UNDO_Stack
//� ����� ����������� �� ���������, � ����� ��������
void CDoUndo2::PushToUndo(const sDoUndo2_item* const pITEM_toCopyFrom_in)
{
	m_UndoStack.Push(pITEM_toCopyFrom_in);
}

// ���������� �������� � DO_Stack
//� ����� ����������� �� ���������, � ����� ��������
void CDoUndo2::PushToDo(const sDoUndo2_item* const pITEM_toCopyFrom_in)
{
	m_DoStack.Push(pITEM_toCopyFrom_in);
}

//������� ���������� �� Undo �����
bool CDoUndo2::PopFromUndo(sDoUndo2_item* const pITEM_toCopyTo_out)
{
	return m_UndoStack.Pop(pITEM_toCopyTo_out);
}

//������� ���������� �� Do �����
bool CDoUndo2::PopFromDo(sDoUndo2_item* const pITEM_toCopyTo_out)
{
	return m_DoStack.Pop(pITEM_toCopyTo_out);
}


/////////////////////////////////
////////// ���������  ///////////
/////////////////////////////////


//"����� ����� ��������".
//��� ��������� ����� �������� �� ����� ���������� ��������� ����� -
//� �������� ��������� �������� �������, ������� �������� ���������� �����
//�� ������������� ��������. ���� ������� ���������� � ���� UNDO.
//��� ���� ���� DO ���������.
void CDoUndo2::SaveItemBeforeNewAction(const sDoUndo2_item* const pITEM_in)
{
	//��������� � ���� UNDO � ������� ���� DO
	PushToUndo(pITEM_in);
	m_DoStack.ClearStack();
}

//�������� "UNDO" (�����)
//��� ��������� ����� ��������, ����� ����� �����.
//� �������� ��������� �������� �������, ������� �������� ������� ���������� �����
//���� ������� ���������� � ���� DO. ������� ��, ��������� �� ����� UNDO
//����� ������� �� ����� *pITEM_in_out - ������ ������� ����������� �����.
//���� ��������� ������� false, �� ���� ����
bool CDoUndo2::OperationUndo(sDoUndo2_item* const pITEM_in_out)
{
	//���� ���� Undo ���� - �������
	if(m_UndoStack.IsEmpty())return false;
	//��������� ������� ������ � ���� DO
	//� �������� �� ������� �� ����� UNDO
	PushToDo(pITEM_in_out);
	PopFromUndo(pITEM_in_out);
	return true;
}

//�������� "DO" (�������)
//��� ��������� ����� ��������, ����� ����� �������.
//� �������� ��������� �������� �������, ������� �������� ������� ���������� �����
//���� ������� ���������� � ���� UNDO. ������� ��, ��������� �� ����� DO
//����� ������� �� ����� *pITEM_in_out - ������ ������� ����������� �����.
//���� ��������� ������� false, �� ���� ����
bool CDoUndo2::OperationDo(sDoUndo2_item* const pITEM_in_out)
{
	//���� ���� Do ���� - �������
	if(m_DoStack.IsEmpty())return false;
	//��������� ������� ������ � ���� UNDO
	//� �������� �� ������� �� ����� DO
	PushToUndo(pITEM_in_out);
	PopFromDo(pITEM_in_out);
	return true;
}

//�������� ���������� ���������, ���������� � ���� DO
int CDoUndo2::GetDoFilledNum()
{
	return m_DoStack.GetFilledNum();
}

//�������� ���������� ���������, ���������� � ���� UNDO
int CDoUndo2::GetUndoFilledNum()
{
	return m_UndoStack.GetFilledNum();
}

