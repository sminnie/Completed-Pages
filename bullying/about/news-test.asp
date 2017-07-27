<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/Connections/PACER_WEB.asp" -->
<%

function RoundUp(a)
	RoundUp = int(a+(abs(fix(a)<>a)))
end Function



Dim rs
Dim rs_cmd
Dim rs_numRows

Set rs_cmd = Server.CreateObject ("ADODB.Command")
rs_cmd.ActiveConnection = MM_PACER_WEB_STRING
rs_cmd.CommandText = "SELECT * FROM dbo.bullyNews WHERE posted_date > DATEADD(month, -12, GETDATE()) AND TAB_story <> 'onl' ORDER BY posted_date DESC" 
rs_cmd.Prepared = true

Set rs = rs_cmd.Execute
rs_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rs_numRows = rs_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rs_total
Dim rs_first
Dim rs_last

' set the record count
rs_total = rs.RecordCount

' set the number of rows displayed on this page
If (rs_numRows < 0) Then
  rs_numRows = rs_total
Elseif (rs_numRows = 0) Then
  rs_numRows = 1
End If

' set the first and last displayed record
rs_first = 1
rs_last  = rs_first + rs_numRows - 1

' if we have the correct record count, check the other stats
If (rs_total <> -1) Then
  If (rs_first > rs_total) Then
    rs_first = rs_total
  End If
  If (rs_last > rs_total) Then
    rs_last = rs_total
  End If
  If (rs_numRows > rs_total) Then
    rs_numRows = rs_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (rs_total = -1) Then

  ' count the total records by iterating through the recordset
  rs_total=0
  While (Not rs.EOF)
    rs_total = rs_total + 1
    rs.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (rs.CursorType > 0) Then
    rs.MoveFirst
  Else
    rs.Requery
  End If

  ' set the number of rows displayed on this page
  If (rs_numRows < 0 Or rs_numRows > rs_total) Then
    rs_numRows = rs_total
  End If

  ' set the first and last displayed record
  rs_first = 1
  rs_last = rs_first + rs_numRows - 1
  
  If (rs_first > rs_total) Then
    rs_first = rs_total
  End If
  If (rs_last > rs_total) Then
    rs_last = rs_total
  End If

End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rs
MM_rsCount   = rs_total
MM_size      = rs_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rs_first = MM_offset + 1
rs_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rs_first > MM_rsCount) Then
    rs_first = MM_rsCount
  End If
  If (rs_last > MM_rsCount) Then
    rs_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = Server.HTMLEncode(MM_keepMove) & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>National Bullying Prevention Center - News</title>
<link rel="icon" href="http://www.pacer.org/bullying/favicon.ico" />
<link href="/bullying/css/bullying.css" rel="stylesheet" type="text/css" />
<link href="/bullying/css/bullying.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/bullying/css/scrolling.css"/>
<!--#include virtual="/bullying/dynamic-head-items.html"-->
<link href="/bullying/css/news.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.header_datasetnav {
	width:300px;
	border: 1px solid #999;
	padding: 5px;
	margin:5px 46px 5px 5px;
	background:#eee;
}
</style>

</head>

<body class="onecol">
<div class="container"> <a id="skiptocontent" href="#maincontent">Skip to main content</a> 
	
	<!--#include virtual="/bullying/dynamic-header.html"--> 
	<!--#include virtual="/bullying/topnav.html"--> 
	
	<script type="text/javascript">
	var navId="none";
	if (document.getElementById(navId)){
		document.getElementById(navId).className = document.getElementById(navId).className+" active";
	}
</script>


	<div class="breadcrumb"> <a href="/bullying/">Home</a> /</div>
	
	<!-- ######################### NAVIGATION ################################# --> 
	
	<!--<div class="sidebar1">
<table width="100%" style="margin-top:75px; font-size:.9em" cellpadding="5">
<caption style="padding-bottom:10px; color:#666">News Color Key</caption>
<tr><td class="feature">&nbsp;</td><td>NBPC Media / Featured Story</td></tr>
<tr><td class="related">&nbsp;</td><td>Bullying related story</td></tr>
<tr><td class="web">&nbsp;</td><td>Website Update</td></tr>
</table>
</div>
--> 
	
	<!--<h3 style="margin-top:15px; text-align:center">Archived Years</h3>
<p style="text-align:center">

<%
' <%currYear = DatePart("yyyy", Now()) - 1
' Do While currYear > 2009%>
'  <a href="/bullying/about/news-archive.asp?year=<%=currYear%>"><%=currYear%></a><br />
'<%
'  currYear = currYear - 1
'  Loop%>


</p>
</div>--> 
	<!-- ###################### END Navigation ############################## -->
	
	<div class="content">
		<div class="contentrow singlecolumn row-whitered">
			<div class="singlecolumn">	
				<h1 id="maincontent" style="text-align:center">In The News</h1>
				<!--<div class="fltrt" style="width:375px;">-->
				
				<div style="width:375px; margin:0 auto">
					<table border="0" width="100%" class="header_datasetnav fltrt">
						<tr>
							<td align="center" colspan="4">Page <%=RoundUp(rs_last / 10)%> of <%=RoundUp(rs_total / 10)%></td>
						</tr>
						<tr>
							<td><% If MM_offset <> 0 Then %>
									<a href="<%=MM_moveFirst%>">First</a>
									<% Else %>
									<span style="color:#ccc">First</span>
									<% End If ' end MM_offset <> 0 %></td>
							<td><% If MM_offset <> 0 Then %>
									<a href="<%=MM_movePrev%>">Previous</a>
									<% Else %>
									<span style="color:#ccc">Previous</span>
									<% End If ' end MM_offset <> 0 %></td>
							<td><% If Not MM_atTotal Then %>
									<a href="<%=MM_moveNext%>">Next</a>
									<% Else %>
									<span style="color:#ccc">Next</span>
									<% End If ' end Not MM_atTotal %></td>
							<td><% If Not MM_atTotal Then %>
									<a href="<%=MM_moveLast%>">Last</a>
									<% Else %>
									<span style="color:#ccc">Last</span>
									<% End If ' end Not MM_atTotal %></td>
						</tr>
					</table>
					<p style="text-align:center; padding-top:5px; padding-right:45px; clear:right"> <a style="font-size:.9em" href="/bullying/about/news-archive.asp?year=<%=DatePart("yyyy", Now()) - 1%>">Go To News Archives</a> </p>
				</div>
				<div style="margin:0 auto; width:375px">
					<table width="375px" style="font-size:.9em" cellpadding="5">
						<caption style="padding-bottom:10px; color:#FFF">
						<strong>News Color Key</strong>
						</caption>
						
							<td class="feature">&nbsp;</td>
							<td>NBPC Media / Featured Story</td>
							<td class="related">&nbsp;</td>
							<td>Bullying related story</td>
							<td class="web">&nbsp;</td>
							<td>Website Update</td>
<!--							<td class="feature" style="border:1px white solid">&nbsp;</td>
							<td>NBPC Media / Featured Story</td>
							<td class="related" style="border:1px white solid">&nbsp;</td>
							<td>Bullying related story</td>
							<td class="web" style="border:1px white solid">&nbsp;</td>
							<td>Website Update</td>	-->						
						</tr>
					</table>
				</div>
							
				<div id="newsitems">
					<% 
While ((Repeat1__numRows <> 0) AND (NOT rs.EOF)) 
%>
					<h3 class="<%=(rs.Fields.Item("type").Value)%>" id="nw<%=(rs.Fields.Item("ID").Value)%>"><%=(rs.Fields.Item("heading").Value)%></h3>
					<%If Len(rs.Fields.Item("TAB_image").Value) > 0 And Len(rs.Fields.Item("long_blurb").Value) = 0 Then%>
					<img src="<%=rs.Fields.Item("TAB_image").Value%>" width="200" height="200" alt="" class="fltrt" style="margin-bottom:10px;" />
					<%End If%>
					<p class="date">Posted: <%=FormatDateTime(rs.Fields.Item("posted_date").Value, 2)%></p>
					<%
  If Len(rs.Fields.Item("long_blurb").Value) > 0 Then
	Response.Write(rs.Fields.Item("long_blurb").Value)
  ElseIf Len(rs.Fields.Item("blurb").Value) > 0 Then
    Response.Write(rs.Fields.Item("blurb").Value)
  End If
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rs.MoveNext()
Wend
%>
				</div>
				<br class="clearfloat" />
				<table border="0" class="datasetnav" style="margin:30px auto">
					<tr>
						<td colspan="4" align="center">Page <%=RoundUp(rs_last / 10)%> of <%=RoundUp(rs_total / 10)%></td>
					</tr>
					<tr>
						<td><% If MM_offset <> 0 Then %>
								<a href="<%=MM_moveFirst%>">First</a>
								<% Else %>
								<span style="color:#ccc">First</span>
								<% End If ' end MM_offset <> 0 %></td>
						<td><% If MM_offset <> 0 Then %>
								<a href="<%=MM_movePrev%>">Previous</a>
								<% Else %>
								<span style="color:#ccc">Previous</span>
								<% End If ' end MM_offset <> 0 %></td>
						<td><% If Not MM_atTotal Then %>
								<a href="<%=MM_moveNext%>">Next</a>
								<% Else %>
								<span style="color:#ccc">Next</span>
								<% End If ' end Not MM_atTotal %></td>
						<td><% If Not MM_atTotal Then %>
								<a href="<%=MM_moveLast%>">Last</a>
								<% Else %>
								<span style="color:#ccc">Last</span>
								<% End If ' end Not MM_atTotal %></td>
					</tr>
				</table>
				<div style="text-align:center; width:290px; margin:10px auto; padding-top:5px; clear:right"> <a style="font-size:.9em" href="/bullying/about/news-archive.asp?year=<%=DatePart("yyyy", Now()) - 1%>">Go To News Archives</a> </div>
			</div>
		</div>
		<!-- end .content --></div>
	<!--#include virtual="/bullying/footer.html"--> 
	<!-- end .container --></div>
</body>
</html>
<%
rs.Close()
Set rs = Nothing
%>
