%%

%unicode 6.0
%public
%class UnicodeScripts_6_0_extensions_4

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-defined-values-only-java

%%

<<EOF>> { printOutput(); return 1; }
\p{Script_Extensions:Hiragana} { setCurCharPropertyValue("Script_Extensions:Hiragana"); }
\p{Script_Extensions:Oriya} { setCurCharPropertyValue("Script_Extensions:Oriya"); }
\p{Script_Extensions:Tagbanwa} { setCurCharPropertyValue("Script_Extensions:Tagbanwa"); }
[^] { }
