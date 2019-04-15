import beaver.Symbol;
import beaver.Scanner;

%%

%class Scanner
%extends Scanner
%function nextToken
%type Symbol
%yylexthrow Scanner.Exception
%eofval{
	System.out.println("vide "+yytext()); return new Symbol(Terminals.EOF);
%eofval}
%unicode
%line
%column
%{
  private Symbol newToken(short id) {
    return new Symbol(id, yyline , yycolumn, yylength(),null);
  }
  private Symbol newToken(short id, Object value) {
    return new Symbol(id, yyline , yycolumn , yylength(), value);
  }
%}

// Compléter à partir d'ici
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} |
          {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/*" "*"+ [^/*] ~"*/"
/* identifiers */
Identifier = [:jletter:][:jletterdigit:]*

Integer = [0-9]+
//Decimal = ({Integer}(\.{Integer})?)|(\.{Integer})
//hexadecimal =[a-fA-F0-9]
//Float = {Decimal}([eE][+-]?{Integer})?
//Unary =	sqrt |sin | round |cos | tan | abs
//Binary =min|max|pow

%%
//KEYWORD

"type"						{  return newToken(Terminals.TOKEN_TYPE); }
"string"					{  return newToken(Terminals.TOKEN_STRING); }
"interger"				{  return newToken(Terminals.TOKEN_INTEGER); }
"boolean"					{  return newToken(Terminals.TOKEN_BOOLEAN); }
"array"						{  return newToken(Terminals.TOKEN_ARRAy); }
"of"							{  return newToken(Terminals.TOKEN_OF); }
"struct"					{  return newToken(Terminals.TOKEN_STRUCT); }

"var"							{  return newToken(Terminals.TOKEN_VAR); }
"procedure"				{  return newToken(Terminals.TOKEN_PROCEDURE); }
"function"				{  return newToken(Terminals.TOKEN_FUNCTION); }
"begin"						{  return newToken(Terminals.TOKEN_BEGIN); }
"end"							{  return newToken(Terminals.TOKEN_END); }
"new"							{  return newToken(Terminals.TOKEN_NEW); }
"dispose"					{  return newToken(Terminals.TOKEN_DISPOSE); }

"println"					{  return newToken(Terminals.TOKEN_PRINTLN); }
"readln"					{  return newToken(Terminals.TOKEN_READLN); }
"return"					{  return newToken(Terminals.TOKEN_RETURN); }
"if"							{  return newToken(Terminals.TOKEN_IF); }
"then"						{  return newToken(Terminals.TOKEN_THEN); }
"else"						{  return newToken(Terminals.TOKEN_ELSE); }
"while"						{  return newToken(Terminals.TOKEN_WHILE); }
"do"							{  return newToken(Terminals.TOKEN_DO); }

"switch"					{  return newToken(Terminals.TOKEN_SWITCH); }
"case"						{  return newToken(Terminals.TOKEN_CASE); }
"default"					{  return newToken(Terminals.TOKEN_DEFAULT); }

//PONCT
";" 	        	 {  return newToken(Terminals.TOKEN_SEMIC); }
".." 	        	 {  return newToken(Terminals.TOKEN_DOTDOT); }
":" 	         	 {  return newToken(Terminals.TOKEN_COLON); }
"," 	         	 {  return newToken(Terminals.TOKEN_COMMA); }

"(" 	        	 {  return newToken(Terminals.TOKEN_LPAR); }
")" 	        	 {  return newToken(Terminals.TOKEN_RPAR); }
"[" 	        	 {  return newToken(Terminals.TOKEN_LBRACKET); }
"]" 	        	 {  return newToken(Terminals.TOKEN_RBRACKET); }
"{" 	        	 {  return newToken(Terminals.TOKEN_LBRACE); }
"}" 	        	 {  return newToken(Terminals.TOKEN_RBRACE); }

//OPERATOR



"=" 	        	{  return newToken(Terminals.TOKEN_AFF); }
"^" 	        	{  return newToken(Terminals.TOKEN_CIRC); }
"+" 	        	{  return newToken(Terminals.TOKEN_PLUS); }
"-" 	        	{  return newToken(Terminals.TOKEN_MINUS); }
"*" 	        	{  return newToken(Terminals.TOKEN_TIMES); }
"/" 	        	{  return newToken(Terminals.TOKEN_DIV); }
"&&" 	        	{  return newToken(Terminals.TOKEN_AND); }
"||" 	        	{  return newToken(Terminals.TOKEN_OR); }
"!" 	        	{  return newToken(Terminals.TOKEN_NOT); }
"<" 	        	{  return newToken(Terminals.TOKEN_LT); }
"<=" 	        	{  return newToken(Terminals.TOKEN_LE); }
">" 	        	{  return newToken(Terminals.TOKEN_GT); }
">=" 	        	{  return newToken(Terminals.TOKEN_GE); }
"==" 	        	{  return newToken(Terminals.TOKEN_EQ); }
"!=" 	        	{  return newToken(Terminals.TOKEN_NE); }

//LITERALS
"true" 	        {  return newToken(Terminals.TOKEN_TRUE); }
"false" 	      {  return newToken(Terminals.TOKEN_FALSE); }
"null" 	        {  return newToken(Terminals.TOKEN_NULL); }
{Identifier} 	  {  return newToken(Terminals.TOKEN_LIT_IDENTIFIER); }
{Integer}	      {  return newToken(Terminals.TOKEN_LIT_INTEGER ); }


{WhiteSpace}                   { /* ignore */ }
{Comment} {/*ignore */}
