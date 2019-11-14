unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.MultiView, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    ListBoxItem3: TListBoxItem;
    edtNome_layout1: TEdit;
    edtSalario_layout1: TEdit;
    edtTempoServico_layout1: TEdit;
    edtDependentes_layout1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtFixo_layout2: TEdit;
    edtAdicional_layout2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    edtResult_dependentes: TEdit;
    edtResult_TempoServico: TEdit;
    edtResult_Cargo: TEdit;
    edtResult_Total: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    lblResut: TLabel;
    Button2: TButton;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure Layout1Click(Sender: TObject);
    procedure Layout2Click(Sender: TObject);
    procedure Layout3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  nome: String;
  salario, fixoDependente, cargo: Double;
  dependentes, temposervico, adicional: Integer;


implementation

{$R *.fmx}






procedure TForm1.Button2Click(Sender: TObject);
begin
  Layout1.Visible:= true;
  Layout2.Visible:= false;
  Layout3.Visible:= false;
  MultiView1.TargetControl := Layout1;


  edtNome_layout1.Text:='';
  edtSalario_layout1.Text:='';
  edtTempoServico_layout1.Text:='';
  edtDependentes_layout1.Text:='';
  edtFixo_layout2.Text:='';
  edtAdicional_layout2.Text:='';


end;

procedure TForm1.Layout1Click(Sender: TObject);
begin
  nome:= edtNome_layout1.Text;
  dependentes:= StrToInt(edtDependentes_layout1.Text);
  temposervico:= StrToInt(edtTempoServico_layout1.Text);
  salario:= StrToFloat(edtSalario_layout1.Text);
end;

procedure TForm1.Layout2Click(Sender: TObject);
begin
  adicional:= StrToInt(edtAdicional_layout2.Text);
  fixoDependente:= StrToFloat(edtFixo_layout2.Text);
end;

procedure TForm1.Layout3Click(Sender: TObject);
var resultDependente, resultTotal : double;
begin
  resultDependente:= dependentes*fixoDependente;
  edtResult_dependentes.Text:= FloatToStr(resultDependente);
end;

procedure TForm1.ListBoxItem1Click(Sender: TObject);
begin
  Layout2.Visible:= false;
  Layout1.Visible:= true;
  Layout3.Visible:= false;
  MultiView1.TargetControl := Layout1;
end;

procedure TForm1.ListBoxItem2Click(Sender: TObject);
begin
  nome:= edtNome_layout1.Text;
  dependentes:= StrToInt(edtDependentes_layout1.Text);
  temposervico:= StrToInt(edtTempoServico_layout1.Text);
  salario:= StrToFloat(edtSalario_layout1.Text);

  Layout1.Visible:= false;
  Layout2.Visible:= true;
  Layout3.Visible:= false;
  MultiView1.TargetControl := Layout2;
end;

procedure TForm1.ListBoxItem3Click(Sender: TObject);
var resultDependentes, resultTempoServico, resultCargo, salarioTotal: double;
begin
  adicional:= StrToInt(edtAdicional_layout2.Text);
  fixoDependente:= StrToFloat(edtFixo_layout2.Text);




  if RadioButton1.IsChecked = true then
  begin
    resultCargo:= (1.05*salario)-salario;
    edtResult_Cargo.Text:= FloatToStr(resultCargo);
  end;
  if RadioButton2.IsChecked = true then
  begin
    resultCargo:= (1.10*salario)-salario;
    edtResult_Cargo.Text:= FloatToStr(resultCargo);
  end;
  if RadioButton3.IsChecked = true then
  begin
    resultCargo:= (1.15*salario)-salario;
    edtResult_Cargo.Text:= FloatToStr(resultCargo);
  end;
  if RadioButton4.IsChecked = true then
  begin
    resultCargo:= (1.20*salario)-salario;
    edtResult_Cargo.Text:= FloatToStr(resultCargo);
  end;




  resultTempoServico:= temposervico*((adicional*salario)/100);
  edtResult_TempoServico.Text:= FloatToStr(resultTempoServico);

  resultDependentes:= dependentes*fixoDependente;
  edtResult_dependentes.Text:= FloatToStr(resultDependentes);

  salarioTotal:= salario + resultCargo + resultDependentes+ resultTempoServico;
  edtResult_Total.Text:= FloatToStr(salarioTotal);


  lblResut.Text:= ('Nome: '+nome + ' Salário: '+ FloatToStr(salarioTotal));


  Layout1.Visible:= false;
  Layout2.Visible:= false;
  Layout3.Visible:= true;
  MultiView1.TargetControl := Layout3;

end;

end.
