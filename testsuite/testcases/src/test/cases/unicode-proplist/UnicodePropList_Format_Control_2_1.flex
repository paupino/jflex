%%

%unicode 2.1
%public
%class UnicodePropList_Format_Control_2_1

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Format Control} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
