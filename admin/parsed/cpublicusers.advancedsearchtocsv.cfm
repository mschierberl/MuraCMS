<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: cPublicUsers --->
<!--- fuseaction: advancedSearchToCSV --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "cPublicUsers">
<cfset myFusebox.thisFuseaction = "advancedSearchToCSV">
<cfif not isDefined("attributes.siteID")><cfset attributes.siteID = "default" /></cfif>
<cfif not isUserInRole('S2IsPrivate')>
<cflocation url="index.cfm?fuseaction=cLogin.main&returnURL=#urlEncodedFormat('index.cfm?#cgi.query_string#')#" addtoken="false">
<cfabort>
</cfif>
<cfif (not isUserInRole('Admin;#application.settingsManager.getSite(attributes.siteid).getPrivateUserPoolID()#;0') and not isUserInRole('S2')) and not ( application.permUtility.getModulePerm('00000000000000000000000000000000008','#attributes.siteid#') and application.permUtility.getModulePerm('00000000000000000000000000000000000','#attributes.siteid#'))>
<cfset application.utility.backUp() >
</cfif>
<cfif not isDefined("request.error")><cfset request.error = "#structnew()#" /></cfif>
<cfif not isDefined("attributes.startrow")><cfset attributes.startrow = "1" /></cfif>
<cfif not isDefined("attributes.userid")><cfset attributes.userid = "" /></cfif>
<cfif not isDefined("attributes.routeid")><cfset attributes.routeid = "" /></cfif>
<cfif not isDefined("attributes.categoryid")><cfset attributes.categoryid = "" /></cfif>
<cfif not isDefined("attributes.search")><cfset attributes.search = "" /></cfif>
<cfif not isDefined("attributes.newSearch")><cfset attributes.newSearch = "false" /></cfif>
<cfif attributes.userid eq ''>
<cfif not isDefined("attributes.Action")><cfset attributes.Action = "Add" /></cfif>
<cfelse>
<cfif not isDefined("attributes.Action")><cfset attributes.Action = "Update" /></cfif>
</cfif>
<cfset request.rsGroups = application.userManager.getPublicGroups('#attributes.siteid#',1) >
<!--- do action="vPublicUsers.advancedSearchToCSV" --->
<cfset myFusebox.thisCircuit = "vPublicUsers">
<cfsavecontent variable="fusebox.layout">
<cfif not isDefined("attributes.Type")><cfset attributes.Type = "0" /></cfif>
<cfif not isDefined("attributes.ContactForm")><cfset attributes.ContactForm = "0" /></cfif>
<cfif not isDefined("attributes.isPublic")><cfset attributes.isPublic = "0" /></cfif>
<cfif not isDefined("attributes.username")><cfset attributes.username = "" /></cfif>
<cfif not isDefined("attributes.email")><cfset attributes.email = "" /></cfif>
<cfif not isDefined("attributes.jobtitle")><cfset attributes.jobtitle = "" /></cfif>
<cfif not isDefined("attributes.password")><cfset attributes.password = "" /></cfif>
<cfif not isDefined("attributes.lastupdate")><cfset attributes.lastupdate = "" /></cfif>
<cfif not isDefined("attributes.lastupdateby")><cfset attributes.lastupdateby = "" /></cfif>
<cfif not isDefined("attributes.lastupdatebyid")><cfset attributes.lastupdatebyid = "0" /></cfif>
<cfif not isDefined("rsGrouplist.recordcount")><cfset rsGrouplist.recordcount = "0" /></cfif>
<cfif not isDefined("attributes.groupname")><cfset attributes.groupname = "" /></cfif>
<cfif not isDefined("attributes.fname")><cfset attributes.fname = "" /></cfif>
<cfif not isDefined("attributes.lname")><cfset attributes.lname = "" /></cfif>
<cfif not isDefined("attributes.address")><cfset attributes.address = "" /></cfif>
<cfif not isDefined("attributes.city")><cfset attributes.city = "" /></cfif>
<cfif not isDefined("attributes.state")><cfset attributes.state = "" /></cfif>
<cfif not isDefined("attributes.zip")><cfset attributes.zip = "" /></cfif>
<cfif not isDefined("attributes.phone1")><cfset attributes.phone1 = "" /></cfif>
<cfif not isDefined("attributes.phone2")><cfset attributes.phone2 = "" /></cfif>
<cfif not isDefined("attributes.fax")><cfset attributes.fax = "" /></cfif>
<cfif not isDefined("attributes.perm")><cfset attributes.perm = "0" /></cfif>
<cfif not isDefined("attributes.groupid")><cfset attributes.groupid = "" /></cfif>
<cfif not isDefined("attributes.routeid")><cfset attributes.routeid = "" /></cfif>
<cfif not isDefined("attributes.s2")><cfset attributes.s2 = "0" /></cfif>
<cfif not isDefined("attributes.InActive")><cfset attributes.InActive = "0" /></cfif>
<cfif not isDefined("attributes.startrow")><cfset attributes.startrow = "1" /></cfif>
<cfif not isDefined("request.error")><cfset request.error = "#structnew()#" /></cfif>
<cftry>
<cfoutput><cfinclude template="../view/vPublicUsers/dsp_advancedSearchToCSV.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 27 and right(cfcatch.MissingFileName,27) is "dsp_advancedSearchToCSV.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_advancedSearchToCSV.cfm in circuit vPublicUsers which does not exist (from fuseaction vPublicUsers.advancedSearchToCSV).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="layout.empty" --->
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "empty">
<cfif not isDefined("fusebox.ajax")><cfset fusebox.ajax = "" /></cfif>
<cfif not isDefined("fusebox.layout")><cfset fusebox.layout = "" /></cfif>
<cftry>
<cfoutput><cfinclude template="../view/layouts/empty.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 9 and right(cfcatch.MissingFileName,9) is "empty.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse empty.cfm in circuit layout which does not exist (from fuseaction layout.empty).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>
