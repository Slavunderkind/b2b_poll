document.addEventListener('DOMContentLoaded', () => {
  const answersContainer = document.querySelector('#answers');
  const addAnswerLink = document.querySelector('#add-answer');

  if (addAnswerLink) {
    addAnswerLink.addEventListener('click', (e) => {
      e.preventDefault();

      // Get the template from the data-template attribute
      const template = addAnswerLink.dataset.template;

      if (!template) {
        console.error("Template is missing on the 'Add Answer' link.");
        return;
      }

      // Replace NEW_RECORD with a unique ID (timestamp)
      const newId = new Date().getTime();
      const newFieldHtml = template.replace(/NEW_RECORD/g, newId);

      // Create a new div element, set its inner HTML, and append it
      const newFieldDiv = document.createElement('div');
      newFieldDiv.innerHTML = newFieldHtml;
      answersContainer.appendChild(newFieldDiv);
    });

    answersContainer.addEventListener('click', (e) => {
      if (e.target.classList.contains('remove-answer')) {
        e.preventDefault();

        // Remove the parent container of the clicked "Remove" button
        const fieldToRemove = e.target.closest('.answer-fields');
        if (fieldToRemove) {
          fieldToRemove.remove();
        }
      }
    });
  }
});
