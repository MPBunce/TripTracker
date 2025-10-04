import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]

  connect() {
    this.updateDayNumbers()
  }

  add(event) {
    event.preventDefault()
    
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML('beforeend', content)
    this.updateDayNumbers()
  }

  remove(event) {
    event.preventDefault()
    
    const dayItem = event.target.closest('.trip-day')
    const destroyField = dayItem.querySelector('.destroy-flag')
    
    if (destroyField && destroyField.value !== "1") {
      destroyField.value = "1"
      dayItem.style.display = 'none'
    } else if (!destroyField) {
      dayItem.remove()
    }
    
    this.updateDayNumbers()
  }

  updateDayNumbers() {
    const visibleDays = this.containerTarget.querySelectorAll('.trip-day:not([style*="display: none"])')
    
    visibleDays.forEach((day, index) => {
      const dayNumber = index + 1
      
      // Update all badges
      const badges = day.querySelectorAll('.day-badge')
      badges.forEach(badge => {
        badge.textContent = `Day ${dayNumber}`
      })
      
      // Update all hidden day_number fields
      const dayNumberInputs = day.querySelectorAll('.day-number-input')
      dayNumberInputs.forEach(input => {
        input.value = dayNumber
      })
      
      // Handle alternating sides
      const timelineStart = day.querySelector('.timeline-start')
      const timelineEnd = day.querySelector('.timeline-end')
      const timelineBoxes = day.querySelectorAll('.timeline-box')
      
      if (index % 2 === 0) {
        // Odd day numbers (1, 3, 5) - show RIGHT side
        if (timelineStart) timelineStart.style.display = 'none'
        if (timelineEnd) timelineEnd.style.display = 'block'
        timelineBoxes.forEach(box => box.style.transform = 'scale(1)')
      } else {
        // Even day numbers (2, 4, 6) - show LEFT side (larger)
        if (timelineStart) timelineStart.style.display = 'block'
        if (timelineEnd) timelineEnd.style.display = 'none'
        timelineBoxes.forEach(box => box.style.transform = 'scale(1.05)')
      }
    })
  }
}