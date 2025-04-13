{
  "name": "service_schema",
  "schema": {
    "type": "object",
    "properties": {
      "services": {
        "type": "array",
        "items": {
          "anyOf": [
            <#list schemaList as schema>
            {
              "type": "object", 
              "properties": {
                "service_name": {
                  "type": "string",
                  "enum": ["${schema.nodeName}"]
                },
                "name": {
                  "type": "string"
                },
                "description": {
                  "type": "string"  
                },
                "unique_out_map_name": {
                  "type": "string"
                },
                "in_map": { "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      <#list schema.in_map as input>
                        "${input.key}": {
                          "type": "${input.type}"<#if input.type == "string" || input.type == "array">,</#if>
                          <#if input.value?has_content && input.type == "string">
                          "enum": ["${input.value}"]
                          <#elseif input.type == "string">
                          "enum": ["${input.key}"]
                          </#if>
                          <#if input.type == "array">
                            "items": {
                              "type": "string"
                            }
                          </#if>
                        }<#sep>,</#sep>
                      </#list>
                    },
                    "required": [<#list schema.in_map_name_list as name>"${name}"<#sep>, </#sep></#list>],
                    "additionalProperties": false
                  }
                }
              },
              "required": ["service_name", "name", "description", "unique_out_map_name", "in_map"],
              "additionalProperties": false
            }<#sep>,</#sep>
            </#list>
          ]
        }
      }
    },
    "required": ["services"],
    "additionalProperties": false
  },
  "strict": true
}
<#--  {
  "name": "content_compliance",
  "schema": {
    "type": "object",
    "properties": {
      "violates": {
        "type": "boolean",
        "description": "Indicates whether the content violates policies."
      },
      "violation_categories": {
        "type": "array",
        "description": "Categories under which the content violates policies.",
        "items": {
          "type": "string",
          "enum": [
            "sexual",
            "violence",
            "self_harm"
          ]
        }
      },
      "violation_reason": {
        "type": "string",
        "description": "Explanation of why the content violates policies."
      }
    },
    "required": [
      "violates",
      "violation_categories",
      "violation_reason"
    ],
    "additionalProperties": false
  },
  "strict": true
}  -->