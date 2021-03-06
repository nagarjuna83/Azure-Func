<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:ns0="http://BizTalkToAzureMigration.OutMsg" xmlns:s0="http://BizTalkToAzureMigration.InMsg">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:RcvdMsg" />
  </xsl:template>
  <xsl:template match="/s0:RcvdMsg">
    <ns0:Target>
      <Data>
        <TransId>
          <xsl:value-of select="Info/Guid/text()" />
        </TransId>
        <PId>
          <xsl:value-of select="Info/Id/text()" />
        </PId>
      </Data>
    </ns0:Target>
  </xsl:template>
</xsl:stylesheet>