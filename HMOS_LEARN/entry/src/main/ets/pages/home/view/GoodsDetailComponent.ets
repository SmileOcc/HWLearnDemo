/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Constants } from '../../../common/Constants';


@Component
export struct GoodsDetailComponent {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text('xxx' + this.pageInfos.getParamByName('Detail'))
          .fontSize($r('app.float.detail_font_size'))
          .backgroundColor(Color.White)
          .height(Constants.FULL_HEIGHT)
          .width(Constants.FULL_WIDTH)
          .textAlign(TextAlign.Center)
      }.justifyContent(FlexAlign.Center)
    }
  }
}
