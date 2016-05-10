// doundoDlg.cpp : implementation file
//

#include "stdafx.h"
#include "doundo.h"
#include "doundoDlg.h"
//#include "StackDoUndo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif





/////////////////////////////////////////////////////////////////////////////
// CDoundoDlg dialog

void CDoundoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDoundoDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDoundoDlg, CDialog)
	//{{AFX_MSG_MAP(CDoundoDlg)
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_bnDO, OnbnDO)
	ON_BN_CLICKED(IDC_bnUNDO, OnbnUNDO)
	ON_WM_TIMER()
	ON_EN_CHANGE(IDC_edTEXT, OnChangeedTEXT)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

HCURSOR CDoundoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

/////////////////////////////////////////////////////////////////////////////
// CDoundoDlg message handlers
CDoundoDlg::CDoundoDlg(CWnd* pParent)	: CDialog(CDoundoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDoundoDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT

	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	m_CurrentTextState="";
	m_dwdCurrentCursorPos=0;

	//������� ����� ������
	m_DoUndo.SetStacksSizez(100,100);

}

BOOL CDoundoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon



	//������ ������� ��������� ����� (���� � �������) � ���������� ,
	//��� ��� "����������� �������� �����" ������ ��� �� ���������. ����� �������,
	//��� ���� �� �������� ����� ��������
	CEdit* pE=(CEdit*)GetDlgItem(IDC_edTEXT);
	if(pE)
	{
		pE->GetWindowText(m_CurrentTextState);
		m_dwdCurrentCursorPos=pE->GetSel();
	}

	//���� ��� ������� - �������� �� RefreshControls()
	m_bThereWereChanges=true;//"���� ���������"

	SetTimer(1,200,0);//������ ���������� ���������

	return TRUE;
}

//���������� ��������� ��������� 
void CDoundoDlg::RefreshControls()
{
	//��������� ���������� ������ DO/UNDO � ��������� �� ���
	CString txt;

	GetDlgItem(IDC_bnDO)->EnableWindow(m_DoUndo.GetDoFilledNum()==0 ? 0 : 1);
	GetDlgItem(IDC_bnUNDO)->EnableWindow(m_DoUndo.GetUndoFilledNum()==0 ? 0 : 1);

	txt.Format("<<\r\n(%d)",m_DoUndo.GetUndoFilledNum());
	GetDlgItem(IDC_bnUNDO)->SetWindowText(txt);

	txt.Format(">>\r\n(%d)",m_DoUndo.GetDoFilledNum());
	GetDlgItem(IDC_bnDO)->SetWindowText(txt);
}

//������
void CDoundoDlg::OnTimer(UINT nIDEvent) 
{
	//�� ����� m_bThereWereChanges �������, ���� �� �������� ��������
	if(nIDEvent==1 && m_bThereWereChanges)
	{
		m_bThereWereChanges=false;
		RefreshControls();
	}
	
	CDialog::OnTimer(nIDEvent);
}

//��� �� �������� � ��������� ����
void CDoundoDlg::OnChangeedTEXT() 
{
	//��������� ������� ��������� � ����
	//(��� ������ � ���������� m_CurrentTextState, m_dwdCurrentCursorPos)
	sMyItem item;
	item.m_Text=m_CurrentTextState;
	item.m_dwdPos=m_dwdCurrentCursorPos;
	m_DoUndo.SaveItemBeforeNewAction(&item);

	//����� ������� ��������� ���������� � ���������� (��� ��������� ������ � ��������� ����)
	CEdit* pE=(CEdit*)GetDlgItem(IDC_edTEXT);
	if(pE)
	{
		pE->GetWindowText(m_CurrentTextState);
		m_dwdCurrentCursorPos=pE->GetSel();
	}

	m_bThereWereChanges=true;
}

void CDoundoDlg::OnbnDO() 
{
	CEdit* pE=(CEdit*)GetDlgItem(IDC_edTEXT);
	if(pE)
	{
		//�� ������ ������ �������� ������� ��������� (����� �� ����)
		pE->GetWindowText(m_CurrentTextState);
		m_dwdCurrentCursorPos=pE->GetSel();

		//��������������� �� DO
		sMyItem item;
		item.m_Text=m_CurrentTextState;
		item.m_dwdPos=m_dwdCurrentCursorPos;

		m_DoUndo.OperationDo(&item);

		m_CurrentTextState=item.m_Text;
		m_dwdCurrentCursorPos=item.m_dwdPos;
		pE->SetFocus();
		pE->SetWindowText(m_CurrentTextState);
		pE->SetSel(m_dwdCurrentCursorPos);
	}

	m_bThereWereChanges=true;
	RefreshControls();

}

void CDoundoDlg::OnbnUNDO() 
{
	CEdit* pE=(CEdit*)GetDlgItem(IDC_edTEXT);
	if(pE)
	{
		//�� ������ ������ �������� ������� ��������� (����� �� ����)
		pE->GetWindowText(m_CurrentTextState);
		m_dwdCurrentCursorPos=pE->GetSel();

		//��������������� �� UNDO
		sMyItem item;
		item.m_Text=m_CurrentTextState;
		item.m_dwdPos=m_dwdCurrentCursorPos;

		m_DoUndo.OperationUndo(&item);

		m_CurrentTextState=item.m_Text;
		m_dwdCurrentCursorPos=item.m_dwdPos;
		pE->SetFocus();
		pE->SetWindowText(m_CurrentTextState);
		pE->SetSel(m_dwdCurrentCursorPos);
	}

	m_bThereWereChanges=true;
	RefreshControls();
}
