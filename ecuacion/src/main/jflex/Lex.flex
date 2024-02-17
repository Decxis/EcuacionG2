//Codigo integro
package laboratorio01.ecuacion;

import java.io.*;

%%
//Opciones y declaraciones
%public
%class EcuacionLexer

digit = [0-9]
sign = [+|-]
variable = [a-zA-Z]
expo = [2]
whitespace = [\t\r]
newline = [\n]
sigExpo = [^]
igual = [=]
cero = [0]
//Monomio grado 2
G2 = {sign}?{digit}*{variable}{sigExpo}{expo}
//Monomio grado 1
G1 = {sign}?{digit}*{variable}
//Constante
C  = {sign}?{digit}+
%type Token

%eofval{
  return new Token(TokenConstant.EOF,null);
%eofval}

%%
//Analisis Sintactico
{G2}{sign}{G1}{sign}{C}({igual}{cero}) {return new Token(TokenConstant.ECUACIONG2,yytext());}
{G2}{sign}{G1} {return new Token(TokenConstant.ECUACIONG2,yytext());}
{G1}{sign}{G2}{sign}{C} {return new Token(TokenConstant.ECUACIONG2,yytext());}
{C}{sign}{G2}{sign}{G1} {return new Token(TokenConstant.ECUACIONG2,yytext());}
{G1}{sign}{C}{G2} {return new Token(TokenConstant.ECUACIONG2,yytext());}
{whitespace}+  {/*Ignorar*/}
{newline}+  {/*Ignorar*/}
.     {  }
