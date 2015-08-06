<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		
			
			 <xsl:apply-templates select="meterreadings/meterreading" />
			
			
			
	</xsl:template>
	<xsl:template match="meterreading">
	<xsl:variable name="Num" select="number"/>
	<xsl:variable name="Date" select="@date" />
	<xsl:variable name="Read" select="reading"/>
	
		 <xsl:for-each select="document('customers.xml')/customers/customer[meternumber=$Num]">
		 <div class="main">
		 <h2>Bill</h2>
		 <table border="1">
				<tr>
					<th bgcolor="#CCCC00">Name</th>
					<th bgcolor="#CCCC00">Address</th>
					<th bgcolor="#CCCC00">Number</th>
				</tr>
				<tr>
					<td><xsl:value-of select="name"/></td>
					<td><xsl:value-of select="address"/></td>
					<td><xsl:value-of select="@number"/></td>
				</tr>
			</table>
			<h2>Account Summary:<xsl:value-of select="payment[last()]/@date"/> to <xsl:value-of select="$Date"/> - 92 days</h2>
			
				<table border="1">
				<tr>
					<th bgcolor="#FF9900">Meter Number</th>
					<th bgcolor="#FF9900">This Read</th>
					<th bgcolor="#FF9900">Previous Read</th>
					<th bgcolor="#FF9900">Usage (kWh)</th>
				</tr>
				<tr>
					<td><xsl:value-of select="$Num"/></td>
					<td><xsl:value-of select="$Read"/></td>
					<td><xsl:value-of select="payment[last()]/reading"/></td>
					<td><xsl:value-of select="$Read - payment[last()]/reading"/></td>
				</tr>
				</table>
				
				<h2>Account Calculations: </h2>
				<table border="1">
				<tr>
					<th></th>
					<th bgcolor="#32CD32">Use</th>
					<th bgcolor="#32CD32">Rate</th>
					<th bgcolor="#32CD32">Total</th>
				</tr>
				<tr>
					<td bgcolor="#7CFC00"><b>Usage:</b></td>
					<td><xsl:value-of select="$Read - payment[last()]/reading"/></td>
					<td>$0.124</td>
					<td><xsl:value-of select="($Read - payment[last()]/reading) * 0.124"/></td>
				</tr>
				<tr>
					<td bgcolor="#7CFC00"><b>System Access Charge:</b></td>
					<td>92 days</td>
					<td>$0.373</td>
					<td><xsl:value-of select="92 * 0.373"/></td>
				</tr>
				<tr>
					<td bgcolor="#90EE90"><b>Total(excl. GST):</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="(92 * 0.373) + (($Read - payment[last()]/reading) * 0.124)"/></td>
				</tr>
				<tr>
					<td bgcolor="#90EE90"><b>GST payable:</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124)) * 0.10"/></td>
				</tr>
				<tr>
					<td bgcolor="#3CB371"><b>Total:</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="(((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124)) * 0.10) + ((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124))"/></td>
				</tr>
				
				<tr>
					<td  bgcolor="#7CFC00"><b>Last Bill Balance:</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="payment[last()]/amountdue"/></td>
				</tr>
				<tr>
					<td  bgcolor="#7CFC00"><b>Less Payments:</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="payment[last()]/paid"/></td>
				</tr>
				<tr>
					<td  bgcolor="#7CFC00"><b>Total Due:</b></td>
					<td></td>
					<td></td>
					<td><xsl:value-of select="(payment[last()]/amountdue - payment[last()]/paid) + (((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124)) * 0.10) + 
					((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124))"/></td>
				</tr>
				</table>
				<h2>Bill Summary</h2>
				<table border="1">
				<tr>
					<th bgcolor="#FF3300">Due Date</th>
					<th bgcolor="#FF3300">Amount Due:</th>
				</tr>
				<tr>
					<td>29/12/2009</td>
					<td><xsl:value-of select="(payment[last()]/amountdue - payment[last()]/paid) + (((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124)) * 0.10) + 
					((92 * 0.373) + (($Read - payment[last()]/reading) * 0.124))"/></td>
				</tr>
				</table>
			</div>
    </xsl:for-each>
	</xsl:template>
	<xsl:template match="customer">
		<p><xsl:value-of select="meternumber"/></p>
	</xsl:template>
	
</xsl:stylesheet>