%%

%unicode 5.1
%public
%class UnicodeDerivedCoreProperties_ID_Continue_5_1

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{ID_Continue} { setCurCharBlock(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
