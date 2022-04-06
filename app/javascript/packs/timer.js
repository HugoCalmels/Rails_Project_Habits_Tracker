const timerElement = document.createElement('div')

const wrapper = document.querySelector('.main-wrapper')
console.log(wrapper)


timerElement.className = "timer-container"

wrapper.append(timerElement)


date = new Date
console.log(date.getDate())