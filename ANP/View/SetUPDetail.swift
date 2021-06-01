//
//  SetUPDetail.swift
//  ANP
//
//  Created by underTheBlueSun on 2021/06/01.
//

import SwiftUI

struct SetUPDetail: View {
    
    var gubun: String = ""
    
    init(gubun: String) {
        self.gubun = gubun
    
    }
    var body: some View {
        
        if gubun == "사용자 설명서" {
            ScrollView {
                VStack(alignment:.leading){
                    Image("ANPManual1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .padding(.vertical, 5)
                    
                    Image("ANPManual2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .padding(.vertical, 5)
                    
                    Image("ANPManual3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .padding(.vertical, 5)
                }
                
            }
            
        }else if gubun == "개발자 정보" {
            Form {
                Section(header: Text("개발")) {
                    Text("e-mail: wind7129@naver.com").font(.system(size: 13))
                    Text("블로그: blog.naver.com/wind7129").font(.system(size: 13))
                }
                
                Section(header: Text("자문")) {
                    Text("e-mail: ").font(.system(size: 13))
                    Text("블로그: band.us/@jiniplay").font(.system(size: 13))
                }
                
            }
            
        }else if gubun == "참고 문헌" {
            VStack(alignment:.leading){
                Text("• 경상남도교육청, 교육과정과 연계한 놀이자료").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 거꾸로교실 수업자료집").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 바로 지금 협동학습!, 김대권 외 3명, 태크빌교육").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 수업이야 놀이야?! 허쌤의 수업놀이, 허승환, 꿀잼연구소").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 수업, 놀이를 제대로! 만나다, 이종혁, 미래의경영").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 핵심 역량을 키우는 수업 놀이, 나승빈, 맘에드림").font(.system(size: 13)).padding(.vertical, 5)
                Text("• 인디스쿨 (indischool.com)").font(.system(size: 13)).padding(.vertical, 5)
                Spacer()
            }
            .padding()
            
        }else {
            VStack(alignment:.leading){
                Text("수업놀이 does NOT collect private information.").font(.system(size: 13)).padding(.vertical, 5)
//                Spacer()
            }
            .padding()
            
        }
        
    }
}

