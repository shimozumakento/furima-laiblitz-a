document.addEventListener('turbo:load', function() {
  const newProductForm = document.getElementById('new_product');
  const editProductForm = document.getElementById('edit_product');
  const previewList = document.getElementById('previews');

  if (!newProductForm && !editProductForm) return null;
  
  const fileField = document.querySelector('input[type="file"][name="product[image]"]');

  if (!fileField) return null;

  fileField.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    
    const file = e.target.files[0];
    if (!file) return ;

    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
    });
});