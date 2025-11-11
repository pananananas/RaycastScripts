import json

# Load the theme
with open('poimandres-darker.json', 'r') as f:
    theme_data = json.load(f)

# For each theme variant
for theme in theme_data['themes']:
    syntax = theme['style']['syntax']

    # Set type to green (for TSX components)
    syntax['type']['color'] = '#5DE4c7'

    # Override specific type contexts to cyan for imports
    syntax['type.definition'] = {
        "color": "#89ddff",
        "font_style": None,
        "font_weight": None
    }
    syntax['type.reference'] = {
        "color": "#89ddff",
        "font_style": None,
        "font_weight": None
    }

    # Make sure constructor stays cyan for imports
    syntax['constructor']['color'] = '#89ddff'

    # But JSX/TSX constructor stays green
    if 'constructor.jsx' not in syntax:
        syntax['constructor.jsx'] = {
            "color": "#5DE4c7",
            "font_style": None,
            "font_weight": None
        }
    if 'constructor.tsx' not in syntax:
        syntax['constructor.tsx'] = {
            "color": "#5DE4c7",
            "font_style": None,
            "font_weight": None
        }

# Save the modified theme
with open('poimandres-darker.json', 'w') as f:
    json.dump(theme_data, f, indent=2)

print("Theme updated - TSX components should now be green while imports stay cyan")
