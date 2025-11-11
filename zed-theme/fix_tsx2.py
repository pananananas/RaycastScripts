import json

# Load the theme
with open('poimandres-darker.json', 'r') as f:
    theme_data = json.load(f)

# For each theme variant
for theme in theme_data['themes']:
    syntax = theme['style']['syntax']

    # Keep type cyan for imports
    syntax['type']['color'] = '#89ddff'

    # Try setting variable to also catch import names
    syntax['variable']['color'] = '#89ddff'

    # Set tag scopes more aggressively for components
    for scope in ['tag', 'tag.jsx', 'tag.tsx', 'tag.name']:
        if scope in syntax:
            syntax[scope]['color'] = '#5DE4c7'

    # Try JSX opening/closing element scopes
    syntax['tag.opening'] = {
        "color": "#5DE4c7",
        "font_style": None,
        "font_weight": None
    }
    syntax['tag.closing'] = {
        "color": "#5DE4c7",
        "font_style": None,
        "font_weight": None
    }

    # Try element scope
    syntax['element'] = {
        "color": "#5DE4c7",
        "font_style": None,
        "font_weight": None
    }
    syntax['element.jsx'] = {
        "color": "#5DE4c7",
        "font_style": None,
        "font_weight": None
    }
    syntax['element.tsx'] = {
        "color": "#5DE4c7",
        "font_style": None,
        "font_weight": None
    }

    # Remove type.definition and type.reference
    if 'type.definition' in syntax:
        del syntax['type.definition']
    if 'type.reference' in syntax:
        del syntax['type.reference']

# Save the modified theme
with open('poimandres-darker.json', 'w') as f:
    json.dump(theme_data, f, indent=2)

print("Updated: type=cyan, variable=cyan, added element scopes for components")
