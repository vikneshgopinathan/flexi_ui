# FlexiUI Documentation

Complete documentation for FlexiUI - A server-driven UI library for Flutter.

## Table of Contents

- [Overview](#overview)
- [Supported Widgets](#supported-widgets)
  - [Layout Widgets](#layout-widgets)
  - [Text Widgets](#text-widgets)
  - [Button Widgets](#button-widgets)
  - [Navigation Widgets](#navigation-widgets)
  - [List Widgets](#list-widgets)
  - [Card Widgets](#card-widgets)
  - [Input Widgets](#input-widgets)
  - [Display Widgets](#display-widgets)
  - [Utility Widgets](#utility-widgets)
- [Data Sources](#data-sources)
- [Advanced Features](#advanced-features)
- [Best Practices](#best-practices)

## Overview

FlexiUI allows you to create dynamic Flutter UIs from JSON configurations. It supports multiple data sources and provides a comprehensive set of widgets with full parameter support.

## Supported Widgets

### Layout Widgets

#### Scaffold
The main structure widget that provides app bar, body, and floating action button.

```json
{
  "type": "Scaffold",
  "params": {
    "backgroundColor": "white",
    "appBar": {
      "type": "AppBar",
      "params": {
        "title": {
          "type": "Text",
          "params": {"text": "My App"}
        },
        "backgroundColor": "blue",
        "elevation": 4
      }
    }
  },
  "child": {
    "type": "Column",
    "children": [
      {
        "type": "Text",
        "params": {"text": "Hello World"}
      }
    ]
  }
}
```

#### Column
Vertical layout widget for arranging children in a column.

```json
{
  "type": "Column",
  "params": {
    "mainAxisAlignment": "center",
    "crossAxisAlignment": "start",
    "mainAxisSize": "max"
  },
  "children": [
    {
      "type": "Text",
      "params": {"text": "First item"}
    },
    {
      "type": "Text",
      "params": {"text": "Second item"}
    }
  ]
}
```

**Supported Parameters:**
- `mainAxisAlignment`: "start", "end", "center", "spaceBetween", "spaceAround", "spaceEvenly"
- `crossAxisAlignment`: "start", "end", "center", "stretch", "baseline"
- `mainAxisSize`: "min", "max"

#### Row
Horizontal layout widget for arranging children in a row.

```json
{
  "type": "Row",
  "params": {
    "mainAxisAlignment": "spaceEvenly",
    "crossAxisAlignment": "center"
  },
  "children": [
    {
      "type": "Text",
      "params": {"text": "Left"}
    },
    {
      "type": "Text",
      "params": {"text": "Right"}
    }
  ]
}
```

#### Container
A versatile widget that can contain other widgets with styling.

```json
{
  "type": "Container",
  "params": {
    "width": 200,
    "height": 100,
    "padding": {
      "all": 16
    },
    "margin": {
      "horizontal": 8,
      "vertical": 4
    },
    "decoration": {
      "color": "blue",
      "borderRadius": {
        "all": 8
      },
      "boxShadow": [
        {
          "color": "grey",
          "blurRadius": 4,
          "offset": {
            "dx": 0,
            "dy": 2
          }
        }
      ]
    }
  },
  "child": {
    "type": "Text",
    "params": {
      "text": "Container Content",
      "style": {
        "color": "white",
        "fontSize": 16
      }
    }
  }
}
```

**Supported Parameters:**
- `width`, `height`: Number or "double.infinity"
- `padding`, `margin`: EdgeInsets object
- `decoration`: BoxDecoration object with color, borderRadius, boxShadow, image

#### Padding
Adds padding around its child.

```json
{
  "type": "Padding",
  "params": {
    "padding": {
      "all": 16
    }
  },
  "child": {
    "type": "Text",
    "params": {"text": "Padded content"}
  }
}
```

#### Center
Centers its child widget.

```json
{
  "type": "Center",
  "child": {
    "type": "Text",
    "params": {"text": "Centered text"}
  }
}
```

#### Expanded
Expands to fill available space in a flex container.

```json
{
  "type": "Row",
  "children": [
    {
      "type": "Text",
      "params": {"text": "Fixed width"}
    },
    {
      "type": "Expanded",
      "params": {
        "flex": 2
      },
      "child": {
        "type": "Text",
        "params": {"text": "Expanded content"}
      }
    }
  ]
}
```

#### Flexible
Similar to Expanded but doesn't require filling all available space.

```json
{
  "type": "Flexible",
  "params": {
    "flex": 1
  },
  "child": {
    "type": "Text",
    "params": {"text": "Flexible content"}
  }
}
```

#### SizedBox
A box with specified dimensions.

```json
{
  "type": "SizedBox",
  "params": {
    "width": 100,
    "height": 50
  }
}
```

### Text Widgets

#### Text
Displays text with customizable styling.

```json
{
  "type": "Text",
  "params": {
    "text": "Hello World",
    "style": {
      "fontSize": 24,
      "fontWeight": "w700",
      "color": "blue",
      "fontStyle": "italic",
      "letterSpacing": 1.2,
      "wordSpacing": 2.0,
      "height": 1.5,
      "decoration": "underline",
      "decorationColor": "red",
      "decorationStyle": "dashed"
    },
    "textAlign": "center",
    "maxLines": 2,
    "overflow": "ellipsis"
  }
}
```

**Supported Style Parameters:**
- `fontSize`: Number
- `fontWeight`: "w100" to "w900"
- `color`: Color name or hex value
- `fontStyle`: "normal", "italic"
- `letterSpacing`, `wordSpacing`, `height`: Number
- `decoration`: "none", "underline", "lineThrough", "overline"
- `decorationColor`: Color name
- `decorationStyle`: "solid", "double", "dotted", "dashed", "wavy"

**Supported Text Parameters:**
- `textAlign`: "left", "right", "center", "justify"
- `maxLines`: Number
- `overflow`: "ellipsis", "clip", "fade"

### Button Widgets

#### ElevatedButton
A raised button with elevation.

```json
{
  "type": "ElevatedButton",
  "params": {
    "style": {
      "backgroundColor": "blue",
      "foregroundColor": "white",
      "padding": {
        "horizontal": 24,
        "vertical": 12
      }
    }
  },
  "child": {
    "type": "Text",
    "params": {
      "text": "Click Me",
      "style": {
        "color": "white",
        "fontWeight": "w600"
      }
    }
  }
}
```

#### TextButton
A flat button without elevation.

```json
{
  "type": "TextButton",
  "params": {
    "style": {
      "foregroundColor": "blue"
    }
  },
  "child": {
    "type": "Text",
    "params": {
      "text": "Text Button",
      "style": {
        "color": "blue"
      }
    }
  }
}
```

#### IconButton
A button that displays an icon.

```json
{
  "type": "IconButton",
  "params": {
    "icon": {
      "type": "Icon",
      "params": {
        "icon": "star",
        "size": 24,
        "color": "yellow"
      }
    }
  }
}
```

### Navigation Widgets

#### AppBar
The top app bar for navigation.

```json
{
  "type": "AppBar",
  "params": {
    "title": {
      "type": "Text",
      "params": {
        "text": "My App",
        "style": {
          "color": "white",
          "fontSize": 20,
          "fontWeight": "w600"
        }
      }
    },
    "backgroundColor": "blue",
    "elevation": 4,
    "actions": [
      {
        "type": "IconButton",
        "params": {
          "icon": {
            "type": "Icon",
            "params": {
              "icon": "search",
              "color": "white"
            }
          }
        }
      }
    ]
  }
}
```

### List Widgets

#### ListView
A scrollable list of widgets.

```json
{
  "type": "ListView",
  "params": {
    "padding": {
      "all": 16
    }
  },
  "children": [
    {
      "type": "Text",
      "params": {"text": "Item 1"}
    },
    {
      "type": "Text",
      "params": {"text": "Item 2"}
    },
    {
      "type": "Text",
      "params": {"text": "Item 3"}
    }
  ]
}
```

#### GridView
A scrollable grid of widgets.

```json
{
  "type": "GridView",
  "params": {
    "crossAxisCount": 2,
    "childAspectRatio": 0.8,
    "padding": {
      "all": 16
    },
    "crossAxisSpacing": 16,
    "mainAxisSpacing": 16
  },
  "children": [
    {
      "type": "Container",
      "params": {
        "height": 100,
        "decoration": {
          "color": "blue"
        }
      },
      "child": {
        "type": "Center",
        "child": {
          "type": "Text",
          "params": {
            "text": "Grid Item 1",
            "style": {"color": "white"}
          }
        }
      }
    }
  ]
}
```

#### PageView
A scrollable page view for creating carousels.

```json
{
  "type": "PageView",
  "params": {
    "scrollDirection": "horizontal"
  },
  "children": [
    {
      "type": "Container",
      "params": {
        "decoration": {
          "color": "red"
        }
      },
      "child": {
        "type": "Center",
        "child": {
          "type": "Text",
          "params": {
            "text": "Page 1",
            "style": {"color": "white", "fontSize": 24}
          }
        }
      }
    },
    {
      "type": "Container",
      "params": {
        "decoration": {
          "color": "green"
        }
      },
      "child": {
        "type": "Center",
        "child": {
          "type": "Text",
          "params": {
            "text": "Page 2",
            "style": {"color": "white", "fontSize": 24}
          }
        }
      }
    }
  ]
}
```

### Card Widgets

#### Card
A material design card with elevation.

```json
{
  "type": "Card",
  "params": {
    "elevation": 8,
    "color": "white"
  },
  "child": {
    "type": "Padding",
    "params": {
      "padding": {
        "all": 16
      }
    },
    "child": {
      "type": "Column",
      "children": [
        {
          "type": "Text",
          "params": {
            "text": "Card Title",
            "style": {
              "fontSize": 18,
              "fontWeight": "w600"
            }
          }
        },
        {
          "type": "Text",
          "params": {
            "text": "Card content goes here",
            "style": {
              "color": "grey"
            }
          }
        }
      ]
    }
  }
}
```

### Input Widgets

#### GestureDetector
Detects gestures and handles navigation.

```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigate_to_product",
    "productId": "laptop_001"
  },
  "child": {
    "type": "Container",
    "params": {
      "padding": {
        "all": 16
      },
      "decoration": {
        "color": "blue",
        "borderRadius": {
          "all": 8
        }
      }
    },
    "child": {
      "type": "Text",
      "params": {
        "text": "Tap to navigate",
        "style": {
          "color": "white",
          "fontWeight": "w600"
        }
      }
    }
  }
}
```

**Supported Navigation Types:**
- `navigate_to_promotion`: Navigate to promotion page
- `navigate_to_product`: Navigate to product page
- `navigate_to_category`: Navigate to category page

### Display Widgets

#### Icon
Displays an icon.

```json
{
  "type": "Icon",
  "params": {
    "icon": "star",
    "size": 32,
    "color": "yellow"
  }
}
```

**Supported Icons:**
- "star", "home", "settings", "search", "menu", "close", "add", "remove", "edit", "delete"

#### Divider
A horizontal divider line.

```json
{
  "type": "Divider",
  "params": {
    "height": 1,
    "thickness": 2,
    "color": "grey"
  }
}
```

### Utility Widgets

#### Spacer
Creates flexible space in a flex container.

```json
{
  "type": "Row",
  "children": [
    {
      "type": "Text",
      "params": {"text": "Left"}
    },
    {
      "type": "Spacer",
      "params": {
        "flex": 1
      }
    },
    {
      "type": "Text",
      "params": {"text": "Right"}
    }
  ]
}
```

## Data Sources

### Asset Data Source
Load configuration from local assets.

```dart
const dataSource = DataSourceConfig(
  type: DataSourceType.asset,
  assetPath: 'assets/homepage.json',
);
```

### HTTP Data Source
Fetch configuration from remote endpoints.

```dart
const dataSource = DataSourceConfig(
  type: DataSourceType.http,
  url: 'https://api.example.com/ui-config',
  headers: {
    'Authorization': 'Bearer token',
    'Content-Type': 'application/json',
  },
  timeout: Duration(seconds: 30),
);
```

### Local Data Source
Load configuration from local files.

```dart
const dataSource = DataSourceConfig(
  type: DataSourceType.local,
  path: '/path/to/config.json',
);
```

## Navigation & Routing

FlexiUI supports named routing with parameter passing for interactive widgets. This allows you to create dynamic navigation flows in your JSON configurations.

### Setting Up Named Routes

First, register your routes in your `MaterialApp`:

```dart
MaterialApp(
  routes: {
    '/promotion': (context) => const PromotionPage(promotionId: 'default'),
    '/product': (context) => const ProductPage(productId: 'default'),
    '/category': (context) => const CategoryPage(categoryId: 'default'),
  },
  onGenerateRoute: (settings) {
    if (settings.name == '/promotion') {
      final args = settings.arguments as Map<String, dynamic>?;
      final promotionId = args?['promotionId'] as String? ?? 'default';
      return MaterialPageRoute(
        builder: (context) => PromotionPage(promotionId: promotionId),
      );
    }
    if (settings.name == '/product') {
      final args = settings.arguments as Map<String, dynamic>?;
      final productId = args?['productId'] as String? ?? 'default';
      return MaterialPageRoute(
        builder: (context) => ProductPage(productId: productId),
      );
    }
    if (settings.name == '/category') {
      final args = settings.arguments as Map<String, dynamic>?;
      final categoryId = args?['categoryId'] as String? ?? 'default';
      return MaterialPageRoute(
        builder: (context) => CategoryPage(categoryId: categoryId),
      );
    }
    return null;
  },
)
```

### Navigation in JSON Configuration

Use `GestureDetector` widgets with navigation parameters to enable interactive navigation:

#### Promotion Navigation
```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigate_to_promotion",
    "promotionId": "summer_sale_2024"
  },
  "child": {
    "type": "Container",
    "params": {
      "height": 200,
      "decoration": {
        "color": "blue",
        "borderRadius": {
          "all": 12
        }
      }
    },
    "child": {
      "type": "Center",
      "child": {
        "type": "Text",
        "params": {
          "text": "Summer Sale 2024",
          "style": {
            "fontSize": 24,
            "fontWeight": "w700",
            "color": "white"
          }
        }
      }
    }
  }
}
```

#### Product Navigation
```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigate_to_product",
    "productId": "laptop_001"
  },
  "child": {
    "type": "Container",
    "params": {
      "decoration": {
        "color": "white",
        "borderRadius": {
          "all": 8
        },
        "boxShadow": [
          {
            "color": "grey",
            "blurRadius": 4,
            "offset": {
              "dx": 0,
              "dy": 2
            }
          }
        ]
      }
    },
    "child": {
      "type": "Column",
      "children": [
        {
          "type": "Text",
          "params": {
            "text": "MacBook Pro",
            "style": {
              "fontSize": 18,
              "fontWeight": "w600"
            }
          }
        },
        {
          "type": "Text",
          "params": {
            "text": "\\$1,999",
            "style": {
              "fontSize": 16,
              "fontWeight": "w500",
              "color": "green"
            }
          }
        }
      ]
    }
  }
}
```

#### Category Navigation
```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigate_to_category",
    "categoryId": "electronics"
  },
  "child": {
    "type": "Container",
    "params": {
      "width": 80,
      "height": 60,
      "decoration": {
        "color": "grey",
        "borderRadius": {
          "all": 8
        }
      }
    },
    "child": {
      "type": "Center",
      "child": {
        "type": "Text",
        "params": {
          "text": "Electronics",
          "style": {
            "fontSize": 12,
            "fontWeight": "w500"
          }
        }
      }
    }
  }
}
```

### Supported Navigation Types

FlexiUI supports three types of navigation out of the box:

1. **`navigate_to_promotion`** - Navigate to promotion pages
   - Parameter: `promotionId` (String)
   - Route: `/promotion`

2. **`navigate_to_product`** - Navigate to product detail pages
   - Parameter: `productId` (String)
   - Route: `/product`

3. **`navigate_to_category`** - Navigate to category pages
   - Parameter: `categoryId` (String)
   - Route: `/category`

### Custom Navigation Setup

To add custom navigation types, extend the `SimpleWidgetFactory`:

```dart
// In your custom widget factory
static void setupCustomNavigation() {
  SimpleWidgetFactory.onNavigation = (String type, Map<String, dynamic> params) {
    switch (type) {
      case 'navigate_to_custom':
        final customId = params['customId'] as String?;
        Navigator.pushNamed(
          context,
          '/custom',
          arguments: {'customId': customId},
        );
        break;
      default:
        // Handle default navigation
        break;
    }
  };
}
```

### Navigation Parameters

All navigation widgets support the following parameter structure:

```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigation_type",
    "parameterName": "parameter_value",
    "additionalParam": "additional_value"
  },
  "child": {
    // Your widget content
  }
}
```

**Parameter Rules:**
- `onTap` must be one of the supported navigation types
- Additional parameters are passed as arguments to the target route
- Parameter names should match what your route expects
- All parameters are passed as `Map<String, dynamic>` to the target page

### Example: E-commerce Navigation Flow

```json
{
  "rootWidget": {
    "type": "Scaffold",
    "params": {
      "backgroundColor": "white"
    },
    "child": {
      "type": "Column",
      "children": [
        {
          "type": "Text",
          "params": {
            "text": "E-commerce Homepage",
            "style": {
              "fontSize": 24,
              "fontWeight": "w700"
            }
          }
        },
        {
          "type": "GestureDetector",
          "params": {
            "onTap": "navigate_to_promotion",
            "promotionId": "black_friday_2024"
          },
          "child": {
            "type": "Container",
            "params": {
              "height": 150,
              "decoration": {
                "color": "red"
              }
            },
            "child": {
              "type": "Center",
              "child": {
                "type": "Text",
                "params": {
                  "text": "Black Friday Sale",
                  "style": {
                    "color": "white",
                    "fontSize": 20,
                    "fontWeight": "w600"
                  }
                }
              }
            }
          }
        },
        {
          "type": "GridView",
          "params": {
            "crossAxisCount": 2
          },
          "children": [
            {
              "type": "GestureDetector",
              "params": {
                "onTap": "navigate_to_product",
                "productId": "laptop_001"
              },
              "child": {
                "type": "Container",
                "params": {
                  "decoration": {
                    "color": "white",
                    "borderRadius": {
                      "all": 8
                    }
                  }
                },
                "child": {
                  "type": "Column",
                  "children": [
                    {
                      "type": "Text",
                      "params": {
                        "text": "MacBook Pro",
                        "style": {
                          "fontWeight": "w600"
                        }
                      }
                    },
                    {
                      "type": "Text",
                      "params": {
                        "text": "\\$1,999",
                        "style": {
                          "color": "green"
                        }
                      }
                    }
                  ]
                }
              }
            }
          ]
        }
      ]
    }
  }
}
```

### Best Practices for Navigation

1. **Consistent Parameter Naming**: Use consistent parameter names across your app
2. **Error Handling**: Always provide fallback values for missing parameters
3. **Route Validation**: Validate parameters in your route handlers
4. **Deep Linking**: Consider URL-based routing for web support
5. **State Management**: Use proper state management for complex navigation flows

## Advanced Features

### Image Support
Containers can display images from URLs.

```json
{
  "type": "Container",
  "params": {
    "height": 200,
    "decoration": {
      "image": {
        "url": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=200&fit=crop",
        "fit": "cover"
      },
      "borderRadius": {
        "all": 12
      }
    }
  }
}
```

**Supported Image Fits:**
- "cover", "contain", "fill", "fitwidth", "fitheight", "none", "scaledown"

### Color Support
Colors can be specified by name or hex values.

**Named Colors:**
- "red", "blue", "green", "yellow", "orange", "purple", "pink", "black", "white", "grey"

**Hex Colors:**
```json
{
  "type": "Container",
  "params": {
    "decoration": {
      "color": "#FF5722"
    }
  }
}
```

### BorderRadius Support
Various border radius configurations.

```json
{
  "type": "Container",
  "params": {
    "decoration": {
      "borderRadius": {
        "all": 8
      }
    }
  }
}
```

```json
{
  "type": "Container",
  "params": {
    "decoration": {
      "borderRadius": {
        "topLeft": 12,
        "topRight": 12,
        "bottomLeft": 4,
        "bottomRight": 4
      }
    }
  }
}
```

### BoxShadow Support
Add shadows to containers.

```json
{
  "type": "Container",
  "params": {
    "decoration": {
      "boxShadow": [
        {
          "color": "grey",
          "blurRadius": 8,
          "offset": {
            "dx": 0,
            "dy": 4
          }
        }
      ]
    }
  }
}
```

## Best Practices

### 1. JSON Structure
Always wrap your root widget in a `rootWidget` field:

```json
{
  "rootWidget": {
    "type": "Scaffold",
    "params": {
      "backgroundColor": "white"
    },
    "child": {
      "type": "Column",
      "children": [
        {
          "type": "Text",
          "params": {
            "text": "Hello World"
          }
        }
      ]
    }
  }
}
```

### 2. Performance Optimization
- Use `Expanded` and `Flexible` widgets efficiently
- Avoid deeply nested structures
- Use `SizedBox` for spacing instead of empty containers

### 3. Error Handling
Always provide fallback widgets for loading and error states:

```dart
SimpleFlexiUI(
  dataSource: dataSource,
  loadingWidget: const Center(
    child: CircularProgressIndicator(),
  ),
  errorWidget: const Center(
    child: Text('Failed to load configuration'),
  ),
  onError: () {
    // Handle error
    print('Configuration failed to load');
  },
  onSuccess: () {
    // Handle success
    print('Configuration loaded successfully');
  },
)
```

### 4. Navigation
Use GestureDetector for interactive elements:

```json
{
  "type": "GestureDetector",
  "params": {
    "onTap": "navigate_to_product",
    "productId": "laptop_001"
  },
  "child": {
    "type": "Container",
    "params": {
      "decoration": {
        "color": "blue"
      }
    },
    "child": {
      "type": "Text",
      "params": {
        "text": "Product Card",
        "style": {
          "color": "white"
        }
      }
    }
  }
}
```

### 5. Responsive Design
Use flexible layouts for different screen sizes:

```json
{
  "type": "Row",
  "children": [
    {
      "type": "Expanded",
      "child": {
        "type": "Text",
        "params": {"text": "Flexible content"}
      }
    },
    {
      "type": "SizedBox",
      "params": {"width": 16}
    },
    {
      "type": "Text",
      "params": {"text": "Fixed content"}
    }
  ]
}
```

This documentation covers all supported widgets and their usage patterns. For more examples, check the `example/` directory in the repository.
