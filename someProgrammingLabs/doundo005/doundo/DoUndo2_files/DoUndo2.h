#pragma once

//�������� ��� ���������, ������� ����� ��������� � ���� DO/UNDO
//(����� ���������� ���� �������� �� ���� ���������)
struct sDoUndo2_item
{
	//����������� ������ �� *pCopyFromITEM_in � *this
	//(������������ � CDoUndo2::s_stack)
	virtual void sDU2i_CopyToThisFrom(const sDoUndo2_item* pCopyFromITEM_in)=0;

	//������������ ��� ������ new ����������� ���������
	//(� CDoUndo2::s_stack ������������ � �������� new ��� ����������� ���������)
	virtual sDoUndo2_item* sDU2i_NewObject() const =0;

	//������������ ��� ������ delete ����������� ���������
	//(� CDoUndo2::s_stack ������������ � �������� delete ��� ����������� ���������)
	virtual void sDU2i_DeleteThis() const =0;
};

/*
//�������� ����������� ��������� ������������ �������� sChildItem:

struct sChildItem:public sDoUndo2_item
{
	//�������� ������
	<type> m_var1;
	<type> m_var2;
	...
	...

	//�����������
	virtual void sDU2i_CopyToThisFrom(const sDoUndo2_item* pCopyFromITEM_in)=0;
	{
		//��������
		*this=*(sChildItem*)pCopyFromITEM_in;

		//(��� ������ ��������� �����������)
		//m_var1=pCopyFromITEM_in->m_var1;
		//m_var2=pCopyFromITEM_in->m_var2;
		//...
		//...
	}

	virtual sDoUndo2_item* sDU2i_NewObject() const
	{
		return new sChildItem;
	}

	virtual void sDU2i_DeleteThis() const
	{
		delete this;
	}
}
*/


class CDoUndo2
{
	enum
	{
		e_minStSize	=	10,	//����������� ������ �����
		e_maxStSize	=	100,//������������ ������ �����
	};

	//��������� �����
	struct s_stack
	{
		private:
		sDoUndo2_item**	m_pStack;		//����
		int				m_nSize;		//������ ����� � ���������.
		int				m_nNumFilled;	//������� ��������� � �����

		public:

		s_stack()
		{
			memset(this,0,sizeof(*this));
		}

		int GetFilledNum()
		{
			return m_nNumFilled;
		}

		//���� ���� ?
		bool IsEmpty()
		{
			return !m_nNumFilled;
		}

		//�������� �����
		void NewStack(int nSize)
		{
			if(!m_pStack && nSize>0)
			{
				m_pStack=new sDoUndo2_item* [m_nSize=nSize];//������ ����������
				memset(m_pStack,0,sizeof(*m_pStack)*m_nSize);
				m_nNumFilled=0;
			}
		}

		//�������� �����
		void DeleteStack()
		{
			ClearStack();


			if(m_pStack)	delete [] m_pStack;//������� ������ ����������
			m_pStack=0;
			m_nSize=0;
			m_nNumFilled=0;
		}

		//���������, ��� ���� ������
		bool IsValid()
		{
			return (m_pStack && m_nSize>0);
		}

		//������� �����
		void ClearStack()
		{
			if(m_pStack)
			{
				for(int i=0;i<m_nNumFilled;i++)
				{
					if(m_pStack[i])
					{
						m_pStack[i]->sDU2i_DeleteThis();//delete m_pStack[i];
						m_pStack[i]=0;
					}
				}
			}
			m_nNumFilled=0;
		}

		//��������� ������� � ����
		void Push(const sDoUndo2_item* pITEM_toCopyFrom_in)
		{
			//���� ���� �������� �� �����, �� ��������
			//���������� ����� �� ������� �� �������� FIFO,
			//������ ����� ������ �������
			if(m_nNumFilled==m_nSize)
			{
				//������� ������ �������
				if(m_pStack[0])
				{
					m_pStack[0]->sDU2i_DeleteThis();//delete m_pStack[0];
				}

				//�������� ��������� �������� �����
				//� ��������� ���������
				for(int i=1;i<m_nSize;i++)
				{m_pStack[i-1]=m_pStack[i];}
				m_nNumFilled--;
			}

			//��������� ������� � ����������� ���������
			sDoUndo2_item* pNew=pITEM_toCopyFrom_in->sDU2i_NewObject();//sDoUndo2_item* pNew=new sDoUndo2_item;
			if(pNew)
			{
				pNew->sDU2i_CopyToThisFrom(pITEM_toCopyFrom_in);
				m_pStack[m_nNumFilled]=pNew;
				m_nNumFilled++;
			}

		}

		//������� ������� �� �����
		bool Pop(sDoUndo2_item* const pITEM_toCopyTo_out)
		{
			//���� ��������� ���, �� �������
			if(m_nNumFilled==0)return false;
			//��������� ��������� � ��������� �������

			m_nNumFilled--;
			pITEM_toCopyTo_out->sDU2i_CopyToThisFrom(m_pStack[m_nNumFilled]);

			//������� ������� �� �����
			m_pStack[m_nNumFilled]->sDU2i_DeleteThis();//	delete m_pStack[m_nNumFilled];
			return true;
		}
	};

	//////////////////////////////////////////////////
private:

	s_stack m_UndoStack;//���� UNDO
	s_stack m_DoStack;//���� DO
	//////////////////////////////////////////////////
private:
	void DeleteAllStacks();
	void PushToDo(const sDoUndo2_item* const pITEM_toCopyFrom_in);
	bool PopFromDo(sDoUndo2_item* const pITEM_toCopyTo_out);	
	void PushToUndo(const sDoUndo2_item* const pITEM_toCopyFrom_in);
	bool PopFromUndo(sDoUndo2_item* const pITEM_toCopyTo_out);
	//////////////////////////////////////////////////

public:
	CDoUndo2(int UNDO_size=0,int DO_size=0);
	~CDoUndo2();

	//////////////////////////////////////////////////
	//���������
public:
	bool SetStacksSizez(int UNDO_size,int DO_size);
	int GetDoFilledNum();
	int GetUndoFilledNum();
	void SaveItemBeforeNewAction(const sDoUndo2_item* const pITEM_in);
	bool OperationDo(sDoUndo2_item* const pITEM_in_out);
	bool OperationUndo(sDoUndo2_item* const pITEM_in_out);
};

