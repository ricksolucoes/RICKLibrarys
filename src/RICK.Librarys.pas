unit RICK.Librarys;

interface

uses
  FMX.Controls,
  FMX.Platform,
  FMX.VirtualKeyBoard,

  System.Character,

  RICK.Librarys.Interfaces;

type
  TRICKLibrarys = class(TInterfacedObject, iRICKLibrarys)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iRICKLibrarys;

    function StringInSet(const S: String;
      const StringSet: array of String): Boolean;
    function OnlyNumber(const AValue: string): string;
    function Mask(Const AMascara, AValue: string): string;
    function IEFormat(Const ANumber: string; Const AState: string): string;
    function FormatValue(Const AValue: string): string;
    function FormatDate(Const AValue: string; AValidateLength: Boolean = False): string; overload;
    function FormatDate(Const AValue: TDate): string; overload;
    function FormatPeso(const AValue: string): string;
    procedure DelayedSetFocus(Const AValue: TControl);
    procedure ShowKeyboard(Const AValue: TControl);
    procedure HideKeyboard(Const AValue: TControl);
  end;

implementation

{ TRICKLibrarys }

uses
  System.SysUtils, System.Classes;

constructor TRICKLibrarys.Create;
begin

end;

procedure TRICKLibrarys.DelayedSetFocus(Const AValue: TControl);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          AValue.SetFocus;
        end);
    end).Start;
end;

destructor TRICKLibrarys.Destroy;
begin

  inherited;
end;

function TRICKLibrarys.FormatDate(const AValue: string; AValidateLength: Boolean): string;
var
  LValue: string;
begin
  LValue := Copy(AValue, 1, 8);
  try
    if Length(LValue) < 8 then
    begin
      LValue := Mask('##/##/####', LValue);
      if AValidateLength then
        if Length(Trim(LValue)) = 8 then
          LValue:= FormatDate(StrToDate(LValue));
    end
    else
    begin
      try
        LValue := Mask('##/##/####', LValue);
        case AValidateLength of
          True: if Length(Trim(LValue)) = 10 then LValue:= FormatDate(StrToDate(LValue));
          False: StrToDate(LValue)  
        end;

      except
        LValue := EmptyStr;
      end;
    end;
  finally
    Result := LValue;
  end;

end;

function TRICKLibrarys.FormatDate(const AValue: TDate): string;
var
  LDia, LMes, LAno : Word;
begin
  DecodeDate(AValue, LAno, LMes, LDia);

  Result:= DateToStr(EncodeDate(LAno, LMes, LDia));
end;

function TRICKLibrarys.FormatPeso(const AValue: string): string;
var
  LValue: string;
begin
  LValue := AValue;

  if LValue.Trim.IsEmpty then
    LValue := '0';

  try
    Result := FormatFloat('#,##0.000', (StrToFloat(LValue) / 1000));
  except
    Result := FormatFloat('#,##0.000', 0);
  end;
end;

function TRICKLibrarys.FormatValue(const AValue: string): string;
var
  LValue: string;
begin
  LValue := AValue;

  if LValue.Trim.IsEmpty then
    LValue := '0';

  try
    Result := FormatFloat('#,##0.00', (StrToFloat(LValue) / 100));
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

procedure TRICKLibrarys.HideKeyboard(const AValue: TControl);
var
  LService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(
    IFMXVirtualKeyboardService, iInterface(LService));

  if not (LService = nil) then
    LService.HideVirtualKeyboard;
end;

function TRICKLibrarys.IEFormat(const ANumber, AState: string): string;
var
  LMask: string;
  LState: string;
begin
  LMask := EmptyStr;
  LState := AState.ToUpper;

  IF LState = 'AC' Then
    LMask := '##.###.###/###-##';
  IF LState = 'AL' Then
    LMask := '#########';
  IF LState = 'AP' Then
    LMask := '#########';
  IF LState = 'AM' Then
    LMask := '##.###.###-#';
  IF LState = 'BA' Then
    LMask := '######-##';
  IF LState = 'CE' Then
    LMask := '########-#';
  IF LState = 'DF' Then
    LMask := '###########-##';
  IF LState = 'ES' Then
    LMask := '#########';
  IF LState = 'GO' Then
    LMask := '##.###.###-#';
  IF LState = 'MA' Then
    LMask := '#########';
  IF LState = 'MT' Then
    LMask := '##########-#';
  IF LState = 'MS' Then
    LMask := '#########';
  IF LState = 'MG' Then
    LMask := '###.###.###/####';
  IF LState = 'PA' Then
    LMask := '##-######-#';
  IF LState = 'PB' Then
    LMask := '########-#';
  IF LState = 'PR' Then
    LMask := '########-##';
  IF LState = 'PE' Then
    LMask := '##.#.###.#######-#';
  IF LState = 'PI' Then
    LMask := '#########';
  IF LState = 'RJ' Then
    LMask := '##.###.##-#';
  IF LState = 'RN' Then
    LMask := '##.###.###-#';
  IF LState = 'RS' Then
    LMask := '###/#######';
  IF LState = 'RO' Then
    LMask := '###.#####-#';
  IF LState = 'RR' Then
    LMask := '########-#';
  IF LState = 'SC' Then
    LMask := '###.###.###';
  IF LState = 'SP' Then
    LMask := '###.###.###.###';
  IF LState = 'SE' Then
    LMask := '#########-#';
  IF LState = 'TO' Then
    LMask := '###########';

  Result := Mask(LMask, ANumber);
end;

function TRICKLibrarys.Mask(Const AMascara, AValue: string): string;
var
  X: Integer;
  P: Integer;
  LValue: string;
begin
  P := 0;
  LValue := EmptyStr;

  if AValue.IsEmpty then
    Exit;

  for X := 0 to Pred(Length(AMascara)) do
  begin
    if AMascara.Chars[X] = '#' then
    begin
      LValue := LValue + AValue.Chars[P];
      inc(P);
    end
    else
      LValue := LValue + AMascara.Chars[X];

    if P = Length(AValue) then
      Break;
  end;

  Result := LValue;
end;

class function TRICKLibrarys.New: iRICKLibrarys;
begin
  Result := Self.Create;
end;

function TRICKLibrarys.OnlyNumber(const AValue: string): string;
var
  X: Integer;
  LValue: string;
begin
  LValue := EmptyStr;
  for X := 0 to Pred(Length(AValue)) do
    { Check for number }
    if AValue.Chars[X].IsNumber then
      LValue := LValue + AValue.Chars[X];

  Result := LValue;
end;

procedure TRICKLibrarys.ShowKeyboard(const AValue: TControl);
var
  LService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(
    IFMXVirtualKeyboardService, iInterface(LService));

  if  LService = nil then
    Exit;


  LService.ShowVirtualKeyboard(AValue);

  if ((not (AValue = nil)) and (AValue.CanFocus)) then
    DelayedSetFocus(AValue);

end;
function TRICKLibrarys.StringInSet(const S: String;
const StringSet: array of String): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(StringSet) to High(StringSet) do
    if S = StringSet[I] then
    begin
      Result := True;
      Break;
    end;
end;

end.
