import { SwiftUIToolbarIconButton } from 'toolbar-icon-button'

@Component
export struct SwiftUIToolbarIconButtonUsage {
  build() {
    SwiftUIToolbarIconButton({
      icon: '+',
      color: '#235595',
      isEnabled: true
    })
  }
}
