{%- macro has_wifi(amenities = 'amenities') -%}
    lower({{ amenities }}) like '%wifi%'
{%- endmacro -%}



{%- for amenity in amenities -%}
{{ amenity }} like '%{{ amenity }}%' as has_{{ amenity }}
{%- endfor -%}