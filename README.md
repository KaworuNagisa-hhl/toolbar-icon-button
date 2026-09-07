# toolbar-icon-button

`toolbar-icon-button` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃工具栏图标按钮组件，适合顶部栏、悬浮工具栏、卡片操作区和轻量功能入口。默认是透明按钮容器内包一枚玻璃图标盒，可自定义按钮尺寸、图标盒尺寸、颜色、圆角、边框和字号。

## 实际运行效果

下面展示工具栏图标按钮的玻璃底、点击状态和自定义尺寸：

![toolbar icon button preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/toolbar-icon-button@main/docs/toolbar-icon-button-preview.gif)

## 安装

```bash
ohpm install toolbar-icon-button
```

本地源码依赖：

```json5
{
  "dependencies": {
    "toolbar-icon-button": "file:../toolbar-icon-button",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIToolbarIconButton } from 'toolbar-icon-button'
import { SwiftUITone } from 'theme'

@Component
struct HeaderActionButton {
  build() {
    SwiftUIToolbarIconButton({
      icon: '+',
      color: '#141414',
      tone: SwiftUITone.GlassBlack,
      onTap: () => {
        console.info('create record')
      }
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIToolbarIconButton({
  icon: 'T',
  color: '#141414',
  componentWidth: 58,
  componentHeight: 58,
  iconBoxWidth: 44,
  iconBoxHeight: 44,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1,
  cornerRadius: 8,
  textFontSize: 16,
  onTap: () => {
    console.info('toolbar tap')
  }
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from 'theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIToolbarIconButton({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIToolbarIconButtonUsage.ets`。该示例演示了图标按钮、颜色和可用状态，适合工具栏、浮层和快捷操作。

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `icon` | `ResourceStr` | `''` | 按钮图标字符 |
| `color` | `ResourceColor` | 黑色主色 | 图标和强调色 |
| `isEnabled` | `boolean` | `true` | 是否可点击 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `44` | 按钮触控宽度 |
| `componentHeight` | `Length` | `44` | 按钮触控高度 |
| `iconBoxWidth` | `Length` | `30` | 玻璃图标盒宽度 |
| `iconBoxHeight` | `Length` | `30` | 玻璃图标盒高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1` | 边框宽度 |
| `cornerRadius` | `number` | `15` | 图标盒圆角 |
| `textFontSize` | `number` | `12` | 图标字符字号 |
| `onTap` | `() => void` | 空函数 | 点击回调 |
