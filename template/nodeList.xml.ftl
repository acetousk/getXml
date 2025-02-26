<?xml version="1.0" encoding="UTF-8"?>
<process xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://moqui.org/xsd/process-definition-3.xsd">
<#if nodeList?has_content>
    <#list nodeList as node>
    <#if node.type == 'service-call'>
    <service-call name="${node.name}" in-map="[<#list node.inMapList as keyValue>${keyValue.key}:${keyValue.value}<#sep>,</#list>]" out-map="[<#list node.outMapList as keyValue>${keyValue.key}:${keyValue.value}<#sep>,</#list>]"/>
    </#if>
    </#list>
</#if>
</process>
