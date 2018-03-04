import logging
LOG_FORMAT = '%(asctime)-15s - %(levelname)s: %(message)s'

from http.server import BaseHTTPRequestHandler, HTTPServer
from lxml import etree

logging.basicConfig(filename="../logs/service.log", filemode="a", level=logging.INFO, format=LOG_FORMAT)

############################################

PORT = 8080

XSL_LIB = {}
XSL_LIB["okb"] = """
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

############################################

class Dispatcher(BaseHTTPRequestHandler):
    def do_POST(self):
        rid = self.headers["x-request-id"]
        key = self.path[1:]

        logging.info("{0}: Got new \"{1}\" request".format(rid, key))

        rlen = int(self.headers["content-length"])
        xml_str = self.rfile.read(rlen)

        parser = etree.XMLParser(remove_blank_text=True)
        xml = etree.fromstring(xml_str, parser=parser)
        xslt = etree.XML(XSL_LIB[key])
        transform = etree.XSLT(xslt)
        xml_out = transform(xml)
        xml_out_str = etree.tostring(xml_out, pretty_print=True)

        self.send_response(200)
        self.send_header("content-type", "text/xml")
        self.send_header("content-length", str(len(xml_out_str)))
        self.end_headers()

        self.wfile.write(xml_out_str)
        self.wfile.flush()

        logging.info("{0}: Done processing".format(rid))

        return

############################################

# start Web-server
logging.info("Starting server...")
httpd = HTTPServer(("", PORT), Dispatcher)
logging.info("Server is up")
httpd.serve_forever()

