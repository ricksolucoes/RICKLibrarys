# RICKLibrary

<p align="center">
  <b>RICKLibrary</b> is a library for Delphi. Using delphi's Fluent Interface.<br> 
</p>

<h2>⚙️ Install</h2>
<p>*Pre-requisites Delphi FMX</p>
<li><strong>Installation with BOSS</strong>: <br>
<pre>$ boss install https://github.com/ricksolucoes/RICKLibrarys</pre>

<li><strong>Manual Installation</strong>: <br>
Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path</em></li>
<pre><code>../RICKLibrarys/src</code></pre>

<h2>⚡️ How to use the project</h2>
<pre><code>../RICKLibrarys/src</code></pre>

<li><strong>How to use incoming Internet.</strong>: <br>

<pre><span class="pl-k">uses</span>
  RICK.Librarys,
  RICK.Librarys.Interfaces;

<span class="pl-k">implementation</span>

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
      lblResult.Text:= LRICKLibrarys.FormatPeso(edtData.Text);
    7: LRICKLibrarys.DelayedSetFocus(edtData);

  end;
end;</span></pre>
