document.addEventListener('turbo:load', function() {
  const newProductForm = document.getElementById('new_product');
  const editProductForm = document.getElementById('edit_product');
  const previewList = document.getElementById('previews');

  if (!newProductForm && !editProductForm) return;

  const imageLimits = 5;

  const fileField = document.querySelector('input[type="file"][name="product[images][]"]');

  if (!fileField) return;

  fileField.addEventListener('change', handleFileSelect);

  function handleFileSelect(e) {

    const deleteImage = (dataIndex) => {
      const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
      deletePreviewImage.remove();
      const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
      deleteFileField.remove();

      if (document.querySelectorAll('.preview').length < imageLimits) {
        buildNewFileField();
      }
    };

    const dataIndex = e.target.getAttribute('data-index');

    const file = e.target.files[0];

    if (!file) {
      deleteImage(dataIndex);
      return null;
    };

    const blob = window.URL.createObjectURL(file);

    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    };

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";

    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);

    if (document.querySelectorAll('.preview').length < imageLimits) {
      buildNewFileField();
    }
  }

  function buildNewFileField() {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'product[images][]');

    const lastFileField = document.querySelector('input[type="file"][name="product[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);

    newFileField.addEventListener('change', handleFileSelect);

    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
    }


});