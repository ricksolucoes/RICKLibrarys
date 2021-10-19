[0]: https://github.com/ricksolucoes/boss "Site do BOOS"

# RICKLibrary

**RICKLibrary** is a library for Delphi. Using delphi's Fluent Interface.

## ⚙️ Pre-requisites

1. Delphi FMX
2. If you choose to use [BOOS][0] ```https://github.com/ricksolucoes/boss or https://github.com/HashLoad/boss```  the dependency manager, you will have the facility to install all frameworks that are [Pre-requisites](#pre-requisites) for the project.


## 💻 Installation

- By using BOOS
```shell
$ boss install https://github.com/ricksolucoes/RICKLibrary
```
- Manual Installation
  - Download the RICKLibrary;
  - Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path ``` ../RICKLibrary/src ```

 ## ⚡️ How to use the project

  Example of using the **RICKLibrary**
- Show Keyboard
```delphi  
  uses
    RICK.Librarys;
  begin
    TRICKLibrarys.New.ShowKeyboard(edtData);
  end;
```
- Hide Keyboard
```delphi  
  uses
    RICK.Librarys;
  begin
    TRICKLibrarys.New.HideKeyboard(edtData);
  end;
```
- Other actions 
```delphi  
  uses
    RICK.Librarys,
    RICK.Librarys.Interfaces;
  var
    LRICKLibrarys: iRICKLibrarys;
  begin
    LRICKLibrarys := TRICKLibrarys.New;

    case cbxDataFormat.ItemIndex of
      0:
        if LRICKLibrarys.StringInSet(edtData.Text.ToLower, ['ok', 'cancel']) then
          lblResult.Text:= 'There is'
        else
          lblResult.Text:= 'Does Not Exist';
      1:
        lblResult.Text:= LRICKLibrarys.OnlyNumber(edtData.Text);
      2:
        lblResult.Text:= LRICKLibrarys.Mask('###-###', edtData.Text);
      3:
        lblResult.Text:= LRICKLibrarys.IEFormat(edtData.Text, 'RJ');
      4:
        lblResult.Text:= LRICKLibrarys.FormatValue(edtData.Text);
      5:
        lblResult.Text:= LRICKLibrarys.FormatDate(edtData.Text);
      6:
        lblResult.Text:= LRICKLibrarys.FormatDate(edtData.Text, True);
      7:
        lblResult.Text:= LRICKLibrarys.FormatPeso(edtData.Text);
      8:
        LRICKLibrarys.DelayedSetFocus(edtData);

    end;
```

