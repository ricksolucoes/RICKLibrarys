unit RICK.Librarys.Interfaces;

interface
uses
  FMX.Controls;
type
  iRICKLibrarys = interface
    ['{75D944B5-3B99-4842-B1B9-FFC2AAADF557}']
    function StringInSet(const S: String;
      const StringSet: array of String): Boolean;
    function OnlyNumber(const AValue: string): string;
    function Mask(Const AMascara, AValue: string): string;
    function IEFormat(Const ANumber: string; Const AState: string): string;
    function FormatValue(Const AValue: string): string;
    function FormatDate(Const AValue: string): string;
    function FormatPeso(const AValue: string): string;
    procedure DelayedSetFocus(Const AValue: TControl);
  end;
implementation

end.
