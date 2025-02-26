<!--Service Location ${inService}--><service verb="${serviceVerb}"<#if serviceNoun?has_content> noun="${serviceNoun}</#if>"><#if serviceDescription?has_content>
    <description><![CDATA[${serviceDescription}]]></description></#if>
    ${inParameters}
    ${outParameters}
    ${actions}
<#--    <#if secas?has_content><#list secas as seca>${seca}</#list></#if>-->
</service>