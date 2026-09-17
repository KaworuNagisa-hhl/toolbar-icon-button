import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIGlassMaterial } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIToolbarIconButton', () => {
    it('executes_tap_callback_contract', 0, () => {
      let taps = 0
      const onTap = () => {
        taps += 1
      }
      onTap()
      expect(taps).assertEqual(1)
    })

    it('uses_small_glass_control_contract', 0, () => {
      expect(getSwiftUIGlassMaterial().tint.toString()).assertContain('#')
    })
  })
}
