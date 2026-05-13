{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is not none -%}
        {{ custom_schema_name | trim }}
    {%- else -%}
        {%- set path_parts = node.original_file_path.split('/') -%}
        {%- set models_idx = path_parts.index('models') if 'models' in path_parts else -1 -%}
        {%- if models_idx >= 0 and (path_parts | length) > (models_idx + 1) -%}
            {{ path_parts[models_idx + 1] }}
        {%- else -%}
            {{ default_schema }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}
