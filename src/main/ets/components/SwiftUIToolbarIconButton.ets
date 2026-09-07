import { getSwiftUIGlassMaterial, getSwiftUIPalette, swiftUIColorWithOpacity, SwiftUITone } from 'theme'

@Component
export struct SwiftUIToolbarIconButton {
  @Prop icon: ResourceStr = ''
  @Prop color: ResourceColor = getSwiftUIPalette().primary
  @Prop isEnabled: boolean = true
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = 44
  @Prop componentHeight: Length = 44
  @Prop iconBoxWidth: Length = 30
  @Prop iconBoxHeight: Length = 30
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1
  @Prop cornerRadius: number = 15
  @Prop textFontSize: number = 12
  onTap: () => void = () => {
  }

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.color, 0.24) : this.customBorderColor
  }

  build() {
    Button() {
      Stack({ alignContent: Alignment.Center }) {
        Text(this.icon)
          .fontSize(this.textFontSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.color)
          .textAlign(TextAlign.Center)
      }
        .width(this.iconBoxWidth)
        .height(this.iconBoxHeight)
        .backgroundColor(this.fillColor)
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [
            [this.fillColor, 0.0],
            [swiftUIColorWithOpacity(this.color, 0.14), 0.58],
            [this.resolvedTintColor(), 1.0]
          ]
        })
        .backgroundBlurStyle(BlurStyle.Thin)
        .borderRadius(this.cornerRadius)
        .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
        .shadow({ radius: 10, color: swiftUIColorWithOpacity(this.color, 0.10), offsetX: 0, offsetY: 4 })
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .backgroundColor('#00000000')
    .enabled(this.isEnabled)
    .onClick(() => {
      this.onTap()
    })
  }
}
