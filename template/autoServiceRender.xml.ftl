<!--Service Location ${inService}--><service verb="${serviceVerb}"<#if serviceNoun?has_content> noun="${serviceNoun}</#if>"><#if serviceDescription?has_content>
    <description><![CDATA[${serviceDescription}]]></description></#if>
    <in-parameters>
        <#list fieldList as field><parameter name="${field.name}" type="${field.type}" required="${field.required}"/><#sep>
${'\t'}</#list>
    </in-parameters>
    <out-parameters>
        <#list pkFieldList as field><parameter name="${field.name}" type="${field.type}" required="${field.required}"/><#sep>
${'\t'}</#list>
    </out-parameters>
    <action>
        <service-call name="${serviceVerb}#${serviceNoun}" in-map="[<#list fieldList as field>${field.name}:context.${field.name}<#sep>,</#list>]" out-map="[<#list pkFieldList as field>${field.name}:context.${field.name}<#sep>,</#list>]"/>
    </action>
<#--    <#if secas?has_content><#list secas as seca>${seca}</#list></#if>-->
</service>