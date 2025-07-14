//
//  d_dayApp.swift
//  d-day
//
//  Created by 김민수 on 7/7/25.
//

import SwiftUI
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var updateTimer: Timer?
    // 사용자가 설정할 수 있는 타겟 날짜 변수
    var targetDateComponents = DateComponents(year: 2025, month: 6, day: 19)

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        updateDDay()
        startUpdateTimer()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
    func startUpdateTimer() {
        // 디버깅을 위해 10초마다 D-Day 갱신
        updateTimer = Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { _ in
            self.updateDDay()
        }
    }

    func updateDDay() {
        let ddayString = calculateDDay(to: targetDateComponents)
        statusItem?.button?.title = ddayString
        
        // 디버깅용 팝업 표시
        //showDebugPopup()
    }
    
    func showDebugPopup() {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // 오늘 날짜
        let today = Date()
        let todayString = formatter.string(from: today)
        
        // 타겟 날짜
        let targetDate = calendar.date(from: targetDateComponents) ?? Date()
        let targetString = formatter.string(from: targetDate)
        
        // 계산된 일수 차이
        let todayStart = calendar.startOfDay(for: today)
        let targetStart = calendar.startOfDay(for: targetDate)
        let diff = calendar.dateComponents([.day], from: todayStart, to: targetStart).day ?? 0
        let calculatedDays = (diff - 1) * -1
        
        let alert = NSAlert()
        alert.messageText = "D-Day 갱신 디버그"
        alert.informativeText = """
        오늘 날짜: \(todayString)
        타겟 날짜: \(targetString)
        계산된 일수: \(calculatedDays)일
        """
        alert.alertStyle = .informational
        alert.addButton(withTitle: "확인")
        
        // 메인 스레드에서 팝업 표시
        DispatchQueue.main.async {
            alert.runModal()
        }
    }

    func calculateDDay(to target: DateComponents) -> String {
        let calendar = Calendar.current
        guard let targetDate = calendar.date(from: target) else { return "D-?" }
        let today = calendar.startOfDay(for: Date())
        let diff = calendar.dateComponents([.day], from: today, to: targetDate).day ?? 0
        let percent = (Double((diff-1) * -1) / 110.0) * 100.0
        return "\((diff-1) * -1)일 | \(String(format: "%.1f", percent))%"
    }
}

@main
struct d_dayApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView() // 메뉴바 전용 앱이면 윈도우 필요 없음
        }
    }
}
