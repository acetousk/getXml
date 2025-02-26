<?xml version="1.0" encoding="UTF-8"?>
<services xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://moqui.org/xsd/service-definition-3.xsd">
<#if serviceList?has_content>
    <#list serviceList as service>
    <service verb="${service.verb}" noun="${service.noun}">
        <description><![CDATA[${service.description}]]></description>
        <in-parameters>
            <#list service.in_parameters as inParameter><parameter name="${inParameter.name}" type="${inParameter.type}" required="${inParameter.required}"<#if inParameter.default?has_content> default="${inParameter.default}"</#if><#if inParameter.default_value?has_content> default-value="${inParameter.default_value}"</#if>><#if inParameter.description?has_content><description><![CDATA[${inParameter.description}]]></description></#if></parameter><#sep>${'\n            '}</#list>
        </in-parameters>
        <out-parameters>
            <#list service.out_parameters as outParameter><parameter name="${outParameter.name}" type="${outParameter.type}"<#if outParameter.default?has_content> default="${outParameter.default}"</#if>><#if outParameter.description?has_content><description><![CDATA[${outParameter.description}]]></description></#if></parameter><#sep>${'\n            '}</#list>
        </out-parameters>
        <actions>
            <#list service.actions as action>
            <#if action.typeName == 'service-call'><${action.typeName} name="${action.element.name}" in-map="[<#list action.element.in_map as keyValue>${keyValue.value}:${keyValue.key}<#sep>,</#list>]" out-map="<#if action.element.out_map?is_string>${action.element.out_map?string}<#elseif action.element.out_map?is_sequence>${ec.logger.warn("In serviceDefinition.xml.ftl, an out_map is a sequence "+action.element.out_map?c)}<#else>${ec.logger.warn("In serviceDefinition.xml.ftl, an out_map is not a sequence or string "+action.element.out_map?c)}</#if>"/></#if>
            </#list>
        </actions>
    </service>
    </#list>
</#if>
</services>
