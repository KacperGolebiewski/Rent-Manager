function clickFn(event) {
    const checkbox = event.currentTarget;
    checkbox.value = checkbox.checked ? 'dark' : 'light';
    event.currentTarget.closest('form').submit()
}