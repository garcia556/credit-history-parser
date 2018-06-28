from lxml import etree

XSL_LIB = {}
XSL_LIB["ucb"] = """
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="a|c|s">
        <xsl:choose>
            <xsl:when test="@n">
                <xsl:element name="{@n}">
                    <xsl:apply-templates select="@*[not(name() = 'n')]|node()" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{name(.)}">
                    <xsl:apply-templates select="@*|node()" />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
"""

def transform(xml_type, xml_str):
    parser = etree.XMLParser(remove_blank_text = True)
    xml = etree.fromstring(xml_str, parser = parser)
    xslt = etree.XML(XSL_LIB[xml_type])
    xsl_transform = etree.XSLT(xslt)
    xml_out = xsl_transform(xml)
    xml_out_str = etree.tostring(xml_out, pretty_print = True)

    return xml_out_str

'''
def transform_file(xml_type, xml_file):
    xml = etree.parse(xml_file)
    xslt = etree.XML(XSL_LIB[xml_type])
    xsl_transform = etree.XSLT(xslt)
    xml_out = xsl_transform(xml)
    xml_out_str = etree.tostring(xml_out, pretty_print = True)

    return xml_out_str
'''
