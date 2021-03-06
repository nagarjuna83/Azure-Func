<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 ScriptNS0 userCSharp" version="1.0" xmlns:ns0="http://BizTalkToAzureMigration.OutMsg" xmlns:s0="http://BizTalkToAzureMigration.InMsg" xmlns:ScriptNS0="http://schemas.microsoft.com/BizTalk/2003/ScriptNS0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:RcvdMsg" />
  </xsl:template>
  <xsl:template match="/s0:RcvdMsg">
    <xsl:variable name="var:v2" select="string(Info/Guid/text())" />
    <ns0:Target>
      <Data>
        <xsl:variable name="var:v1" select="ScriptNS0:GenerateRandomNum(string(Info/Guid/text()))" />
        <xsl:variable name="var:v3" select="userCSharp:StringConcat($var:v2 , &quot;-&quot; , string($var:v1))" />
        <TransId>
          <xsl:value-of select="$var:v3" />
        </TransId>
        <xsl:variable name="var:v4" select="ScriptNS0:SelectQuery(string(Info/Id/text()))" />
        <PName>
          <xsl:value-of select="$var:v4" />
        </PName>
        <PId>
          <xsl:value-of select="Info/Id/text()" />
        </PId>
      </Data>
    </ns0:Target>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0, string param1, string param2)
{
   return param0 + param1 + param2;
}



]]></msxsl:script>
</xsl:stylesheet>