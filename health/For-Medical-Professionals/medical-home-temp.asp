<% Dim currentPage 

currentPage = "health-enews-2012-05.html"

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>F2F HIC - medical home / health care home</title>
<link rel="shortcut icon" href="http://www.pacer.org/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/leftnavnoright.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
if (typeof jQuery == 'undefined')
{
  document.write(unescape("%3Cscript src='/js/jquery-1.9.1.min.js' type='text/javascript'%3E%3C/script%3E"));
}
var mainDescriptionHeight;
$(document).ready(function() {
	$('#mainReadMore').click(function() {
		$('#mainDescription').animate({
			height: mainDescriptionHeight
			}, 2000, function() {
				$('#mainReadMore').hide();
			});
	});
	//Shrink Window on Load
	mainDescriptionHeight = $('#mainDescription').height();
	alert(mainDescriptionHeight);

	$('#mainDescription').animate({
		height: '202px'}, 500, function() {
			$('#mainReadMore').css('display', 'block');
	});
});
 

 </script>
<style type="text/css">
#mainDescriptionWrapper{
	position:relative;
	border-bottom:1px solid #ccc;
	margin-bottom:10px;
	padding-bottom:10px;
}

#mainDescription{
	height:auto;
	border:5px solid #99A776;
	overflow:hidden;
	margin-bottom:30px;
}



#mainReadMore{
	display:none;
	position:absolute;
	bottom:30px;
	left:15px;
	width:8em;
	text-align:center;
	background:#eee;
	border:1px solid #ccc;
	padding:3px;
	cursor:pointer;
	user-select:none;
}
#mainReadMore:active{
	background:#999;
}



</style>

</head>
<body>
<div id="skiptocontent">
<a href="#maincontent">Skip to main content</a>
</div>

<div id="wrapper">

<div id="main">

<div id="header">
	<div>			<!--#include virtual="/googleSearchBox.htm"-->
   <!-- Contains Contact Pacer | Donate | Google search bar | Social media -->
<a href="/"><img src="/images/pacerLogo.gif" alt="PACER Center Logo: Champions for Children with Disabilities" class="logoImg" /></a>
	</div>
	<!--#include virtual="/dynamicheader.htm"-->
</div>




<div id="pagetoporange">
<div id="breadcrumb">
 <div class="printemail">
  <p> <img src="/css/printicon.gif" width="15" height="14" alt="" /><a href="javascript:window.print()">Print page</a> </p>
 </div>
<a href="/">Home</a> / <a href="/pandr/">Programs &amp; Resources</a> / <a href="/health/health-care-providers.asp">Health</a> / <a href="/health/For-Medical-Professionals/index.asp">For Medical Professionals</a> /
<h1>Family-to-Family Health Information Center</h1>
 </div>
</div>

<div id="leftbar">
<!--#include virtual="/health/leftNav.htm" -->
<!-- Set the nav links that you want to show orange and hide any sub trees that you do not want to show -->
<script type="text/javascript">
	// ID and SubId to be Orange
	var currId="fmpsub-medicalhome";
	var currSubId="none";
	// any Subtree that I want to Display
	var showTree = "health-fmpsub";
	
	if (document.getElementById(currId)){
		document.getElementById(currId).className = "page";
	}
	if (document.getElementById(currSubId)){
		document.getElementById(currSubId).className = "page";
	}
	var subTrees = document.getElementsByTagName("ul");
	for (var i = 0; i < subTrees.length; i++) {
		if (subTrees[i].className == "treemenu") {
			//Any additional subTrees that you want to skip should be added here. like this (subTrees[i] != subTree1 || subTrees[i] != subTree2)
			if (subTrees[i].id != showTree) {
				subTrees[i].className = "treemenuhidden";
			}
		}
	}
</script>


</div>

<div id="maincontent">

<div id="pagecontentright" style="min-height:500px;">

<!--BEGIN CONTENT-->

<h2>Medical Home: A Family-centered System of Care</h2>
<div id="mainDescriptionWrapper">
<div id="mainDescription">
	<p>A medical home is not a building, but a better, family-centered way to provide care for children with special health care needs* and disabilities. In the medical home philosophy of care, information and concerns are shared by everyone caring for the child. Needs are addressed in a coordinated way, with a primary care doctor and their clinical staff serving as a coordinator of the child&rsquo;s health care services. A written care plan is shared with the family and all of the child&rsquo;s health care providers, and the medical home is a central place for the child&rsquo;s complete records. </p>
	<p>Sometimes also known as &ldquo;health care homes,&rdquo; the medical home philosophy of care for children and youth with special health care needs is specific and includes: </p>
	<ul type="disc">
		<li><strong>Partnership:</strong> A medical home provides patient- and family-centered care through an ongoing, collaborative partnership with families, recognizing that they are the constant in a child&rsquo;s life.</li>
		<li><strong>Community-based approach:</strong> The medical home is an integral part of a community-based system of coordinated or networked services that support the health and well-being of children and their families. A physician in a medical home provides ongoing primary care and facilitates access to and coordination with a broad range of specialty and related community services such as schools.</li>
		<li><strong>Transitions:</strong> A medical home provides health care services that include careful transition to the adult system for youth, so that services and care continue uninterrupted as the youth moves from adolescence to adulthood.</li>
	</ul>
	<p><strong>A medical home physician ensures care that is:</strong></p>
	<ul>
		<li><em>Accessible - </em>available 24 hours a day, 7 days a week in the child&rsquo;s community</li>
		<li><em>Family-Centered &ndash; </em><em>recognizes</em>the family as principal caregivers and the center of strength and support for children</li>
		<li><em>Continuous &ndash;</em>available from infancy through adolescence, with the same primary pediatric health care professionals</li>
		<li><em>Comprehensive - </em><em>i</em>ncludes sick and well care as well as education and community referral needs</li>
		<li><em>Coordinated - </em>includes links to support, educational, and community-based services</li>
		<li><em>Compassionate &ndash; </em><em>expresses and demonstrates</em><em> c</em>oncern for well-being of child and family</li>
		<li><em>Culturally effective </em><em>&ndash; recognizes, values, and respects each</em><em>f</em>amily&rsquo;s cultural background</li>
	</ul>
	<p><strong>Why is a medical home important?</strong></p>
	<p>		Most importantly, a medical home can improve the child&rsquo;s health. Families of a child or youth with disabilities or chronic health conditions often have difficulty working and communicating with many doctors, nurses, and other health, education, insurance, and social service professionals. These families benefit from a family-centered, teamwork approach to providing care through:</p>
	<ul type="disc">
		<li>More organized, cost-effective care</li>
		<li>More efficient communication &ndash; families don&rsquo;t have to repeat information to multiple caregivers</li>
		<li>Support from a team of caregivers </li>
		<li>Exams scheduled in a coordinated, efficient way without duplicated services</li>
	</ul>
	<p><strong>What are the roles and duties for the </strong><strong>primary care physician and other health care providers<strong> within a medical home?</strong></strong></p>
	<ul>
		<li>Know the child&rsquo;s health history </li>
		<li>Listen to the parents&rsquo; and child&rsquo;s concerns and needs </li>
		<li>Work in partnership with families to ensure that the medical and non-medical needs of the child and family are met </li>
		<li>Create a trusting, collaborative relationship with the family </li>
		<li>Treat the child with compassion and understanding </li>
		<li>Develop a care plan with the family for their child when needed </li>
		<li>Share impartial and complete information on an ongoing basis</li>
	</ul>
	<p><strong>How do I implement the medical home philosophy?</strong></p>
	<ul>
		<li>Discuss ways to improve care for children and youth with special health care needs and disabilities, and how to begin setting up a medical home with your colleagues and patients</li>
		<li>Read the National Center for Medical Home Implementation&rsquo;s webpage, <a href="http://www.medicalhomeinfo.org/how/">How to Implement</a></li>
		<li>Read the <a href="http://www.medicalhomeinfo.org/downloads/pdfs/JointStatement.pdf" target="_blank">Joint Principles of the Patient-Centered Medical Home</a> <img border="0" width="11" height="12" src="medical-home_clip_image001.gif" alt="PDF" /></li>
		<li>Learn more by contacting PACER&rsquo;s Family-to-Family Health Information Center at 952-838-9000</li>
	</ul>
	<p><strong>*Who are children with special health needs?</strong></p>
	<p>		Minnesota children with special health needs (MCSHN), as defined by the Department of Health and Human Services, Health Resources and Services Administration, Maternal and Child Health Bureau, <em>&ldquo;are those who have or are at increased risk for a chronic physical, development, behavioral, or emotional condition and who also require health and related services of a type or amount beyond that required by children generally.&rdquo;</em><br />
		This includes children who:</p>
	<ul type="disc">
		<li>Have a disability or chronic illness</li>
		<li>Experience physical and emotional consequences from biological or environmental risks, including prematurity and extreme poverty</li>
		<li>Have experienced abuse or neglect</li>
		<li>Need special education or other support services </li>
	</ul>
	
	
</div>
<div id="mainReadMore"><u>Show More</u> &darr;</div>	
</div>

<%'----------------------------------------------- LINK RESOURCES ---------------------------- %>
<h3>Creating a Medical Home</h3>
<p><a href="http://www.medicalhomeinfo.org/" target="_blank">National Center for Medical Home Implementation | American Academy of Pediatrics</a><br />
Resource for health professionals, families, and anyone interested in creating a medical home for all children and youth. </p>
<ul>
 <li><a href="http://www.pediatricmedhome.org/" target="_blank">Building your Medical Home toolkit</a><br />
 Supports the development and/or improvement of a pediatric medical home. The toolkit also gives information to apply for and potentially meet the National Committee for Quality Assurance (NCQA) Patient Centered Medical Home (PCMH) recognition program requirements. </li>
 <li><a href="http://www.medicalhomeinfo.org/about/medical_home/media.aspx" target="_blank">Community-Based services and Medical Home video series</a><br />
 In depth view of the essential components that make up the medical home </li>
 <li><a href="http://pediatrics.aappublications.org/content/113/Supplement_4/1485.full.pdf+html" target="_blank">&ldquo;Access to Medical Home: Results of the National Survey of Children with Special Health Care Needs&rdquo;</a><br />
 Reports the findings of the National Survey of Children With Special Health Care Needs regarding parent perceptions of the extent to which children with special health care needs (CSHCN) have access to a medical home </li>
 <li><a href="http://pediatrics.aappublications.org/content/110/Supplement_3/1322.abstract" target="_blank">&ldquo;Implementing Transitions for Youth with Complex Chronic Conditions Using the Medical Home Model&rdquo;</a><br />
 Specific components of a transition plan are detailed in article along with recommendations regarding formal assessments needed to develop an individualized transition plan. </li>
 <li><a href="http://pediatrics.aappublications.org/content/126/Supplement_3/S129.abstract" target="_blank">&ldquo;The Transition to Adult Health Care for Youth With Special Health Care Needs (YSHCN): Do Racial and Ethnic Disparities Exist?&rdquo;</a><br />
 This article explores evidence of disparities in the transition to adulthood for YSHCN. </li>
</ul>
<h3>Guidance for and current performance of established Medical Homes</h3>
<p><a href="http://www.medicalhomeimprovement.org/projects/national.html" target="_blank">Center for Medical Home Improvement: National Medical Home Projects</a><br />
National organizations providing guidance and information to medical providers and parents.</p>
 <p><a href="http://childhealthdata.org/browse/medicalhome/content/Default.aspx" target="_blank">Medical Home State Data Pages</a><br />
 Data on how children and youth in each state experience receiving care within a medical home</p>
 <p><strong>In Minnesota:</strong></p>
<ul>
 <li><a href="http://mnaap.org/healthcarehome.htm" target="_blank">American Academy of Pediatrics, Minnesota Chapter: Heath Care home</a><br />
 Information regarding Health Care home implementation in Minnesota </li>
 <li><a href="http://www.health.state.mn.us/divs/fh/mcshn/medhm/about.htm" target="_blank">Minnesota Department of Health: How to become a better Medical Home</a><br />
 Outlines Medical Home implementation in Minnesota.</li>
</ul>
<ul>
 <li><a href="http://www.health.state.mn.us/mcshn" target="_blank">Minnesota Department of Health: Children and Youth with Special Health Care Needs</a><br />
 Topics include Financial Resources, Medical Home, Emergency Planning, and Diseases and Conditions. </li>
 <li><a href="http://www.health.state.mn.us/healthreform/homes/certifiedhchs/index.html" target="_blank">Certified Health Care Homes</a><br />
 Search tool to find certified health care homes in Minnesota </li>
 <li><a href="http://www.health.state.mn.us/healthreform/homes/certification/index.html" target="_blank">Medical Home Certification Guide</a><br />
 Steps to certification for medical providers to become certified as a Health Care Home: </li>
</ul>
<p><strong>Parent Resources:</strong></p>
<ul>
 <li><a href="http://www.pacer.org/health/pdfs/HIAC-h24.pdf" target="_blank">Medical Home</a><br />
 Parent friendly brochure explaining the Medical Home concept.</li>
 <li><a href="http://nccc.georgetown.edu/documents/TransitionArticle.pdf" target="_blank">&ldquo;Is Your Youth With Special Health Care Needs Prepared to Partner with the Medical Home&rdquo;</a><br />
  One parent&rsquo;s perspective and ideas on how to transition to new medical providers. </li>
 <li><a href="http://www.consumerreports.org/cro/magazine/2013/07/a-doctor-s-office-that-s-all-about-you/index.htm" target="_blank">&ldquo;A Doctor&rsquo;s office that&rsquo;s all about you&rdquo;</a><br />
 Consumer Reports, July 2013 </li>
</ul>



<!--END CONTENT-->
<div id="pageextender" style="clear:both">&nbsp;</div>


</div>
</div>
</div>

<!--#include virtual="/footer.htm"-->

</div>

</body>
</html>