import { getSwiftUIGlassMaterial, getSwiftUIPalette, swiftUIColorWithOpacity, SwiftUIComponentConfig, SwiftUITone } from 'theme'

@Component
export struct SwiftUIToolbarIconButton {
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
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

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedColor(): ResourceColor {
    return this.config.color === undefined ? this.color : this.config.color
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedIconSize(): Length {
    return this.config.iconSize === undefined ? this.iconBoxWidth : this.config.iconSize
  }

  private resolvedIconHeight(): Length {
    return this.config.iconSize === undefined ? this.iconBoxHeight : this.config.iconSize
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedTextFontSize(): number {
    return this.config.textFontSize === undefined ? this.textFontSize : this.config.textFontSize
  }

  private resolvedTintColor(): ResourceColor {
    if (this.config.tintColor) {
      return this.config.tintColor
    }
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.resolvedTone()).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    if (this.config.borderColor) {
      return this.config.borderColor
    }
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedColor(), 0.24) : this.customBorderColor
  }

  build() {
    Button() {
      Stack({ alignContent: Alignment.Center }) {
        Text(this.icon)
          .fontSize(this.resolvedTextFontSize())
          .fontWeight(FontWeight.Bold)
          .fontColor(this.resolvedColor())
          .textAlign(TextAlign.Center)
      }
        .width(this.resolvedIconSize())
        .height(this.resolvedIconHeight())
        .backgroundColor(this.resolvedFillColor())
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [
            [this.resolvedFillColor(), 0.0],
            [swiftUIColorWithOpacity(this.resolvedColor(), 0.14), 0.58],
            [this.resolvedTintColor(), 1.0]
          ]
        })
        .backgroundBlurStyle(BlurStyle.Thin)
        .borderRadius(this.resolvedCornerRadius())
        .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
        .shadow({ radius: 10, color: swiftUIColorWithOpacity(this.resolvedColor(), 0.10), offsetX: 0, offsetY: 4 })
    }
    .width(this.resolvedWidth())
    .height(this.resolvedHeight())
    .backgroundColor('#00000000')
    .enabled(this.isEnabled)
    .onClick(() => {
      this.onTap()
    })
  }
}
