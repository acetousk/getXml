<!--Transition Screen Location ${inScreen} Transition Name ${transitionName}--><transition name="${transitionName}"><#if parameterList?has_content>
        <#list parameterList as parameter>${parameter}</#list></#if><#if actionList?has_content>
        <actions>
                <#list actionList as action>${action}<#sep>
${'\t\t'}</#list>
        </actions>
</#if>
</transition>