// validation check java Script
'use strict';

function setupValidation(selector) {
  $(selector).each(function () {
    $(this).on('submit', function (event) {
      if (!this.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      $(this).addClass('was-validated');
    });
  });
}

function bizNumFormatter(selector) {
  const inputBizNum = $(selector);

  inputBizNum.on('input', function () {
    let value = $(this).val().replace(/[^0-9]/g, '');

    if (value.length === 0) {
      return;
    }

    if (value.length > 3 && value.length <= 5) {
      value = value.slice(0, 3) + '-' + value.slice(3);
    } else if (value.length > 5) {
      value = value.slice(0, 3) + '-' + value.slice(3, 5) + '-' + value.slice(5, 10);
    }

    $(this).val(value.slice(0, 12));
  });
}

function mapView(selector, address) {
  $(selector).on("click", function () {
    const url = "https://map.naver.com/p/search/" + address;
    window.open(url, '_blank');
  });
}

function uploadMeasurementExcelData(selector) {
  $(selector).on('change', function (e) {
    const file = e.target.files[0];

    if (!file) {
      console.error("파일이 선택 되지 않았습니다.");
      return;
    }

    const reader = new FileReader();

    reader.onload = function (e) {
      const data = new Uint8Array(e.target.result);

      const workbook = XLSX.read(data, {type: "array"});

      const sheetName = workbook.SheetNames[0];
      const worksheet = workbook.Sheets[sheetName];

      const jsonData = XLSX.utils.sheet_to_json(worksheet);

      const processedData = jsonData.map(row => {
        const processedRow = {};
        for (let key in row) {
          processedRow[key] = row[key] === undefined || row[key] === null ? "" : row[key];
        }
        return processedRow;
      });

      processedData.forEach(item => {
        const stack = item["stack"] || "";
        const pollutant = item["pollutant"] || "";
        const aValue = item["aValue"] || "";
        const cycle = item["cycle"] || "";

        const text = `
            <tr>
              <td class="stack_name">` + stack +  `</td>
              <td class="pollutant_name">` + pollutant + `</td>
              <td class="allow_value">` + aValue +  `</td>
              <td class="cycle_type">` + cycle +  `</td>
            </tr>
          `;

        $('#tbody').append(text);
      });
    };

    reader.onerror = function (e) {
      console.error("FileReader 에러 발생:", e);
    };

    reader.readAsArrayBuffer(file);
  });
}

function loadToast(result, msg) {
  if (!result) return;

  const {
    successMsg,
    failedMsg
  } = msg;

  if (result === 'success') {
    const toastElement = $('#successToast');
    toastElement.find('div.toast-body').text(successMsg);
    const toast = new bootstrap.Toast(toastElement);

    toast.show();
  } else if (result === 'fail') {
    const toastElement = $('#failToast');
    toastElement.find('div.toast-body').text(failedMsg);
    const toast = new bootstrap.Toast(toastElement);

    toast.show();
  }
}

// ------------------------
// Crud Functions
// ------------------------

function viewModifyToast() {
  const msg = {
    successMsg: '수정 되었습니다.',
    failedMsg: '수정에 실패 하였습니다.'
  }

  const modifyResult = sessionStorage.getItem('modifyResult');

  if (modifyResult) {
    loadToast(modifyResult, msg);
    sessionStorage.removeItem('modifyResult');
  }
}

function businessModifyHandler(options) {
  const {
    selector,
    url,
  } = options;

  let isReadonly = selector.find('input').prop('readonly');

  if(isReadonly) {
    selector.find('input').prop('readonly', false);
    $('#modifyBtn').html('저장');
    return;
  }

  if (!confirm('수정 하시겠습니까?')) return;

  const form = selector[0];

  if (!form.checkValidity()) {
    $(form).addClass('was-validated');
    return;
  }

  const information = {};

  selector.find('input').each(function(){
    let name = String($(this).attr('name'));
    information[name] = $(this).val();
  });

  const msg = {
    successMsg: '수정 되었습니다.',
    failedMsg: '수정에 실패 하였습니다.'
  }

  $.ajax({
    type: 'PATCH',
    url: url,
    headers : { 'Content-Type': 'application/json'},
    dataType : 'text',
    data : JSON.stringify(information),
    success: function() {
      sessionStorage.setItem('modifyResult', 'success');
      location.reload();
    },
    error: function() {
      loadToast('fail', msg);
    }
  });
}

function viewDeleteToast() {
  const msg = {
    successMsg: '삭제 되었습니다.',
    failedMsg: '삭제에 실패 하였습니다.'
  }

  const deleteResult = sessionStorage.getItem('deleteResult');

  if (deleteResult) {
    loadToast(deleteResult, msg);
    sessionStorage.removeItem('deleteResult');
  }
}

function businessDeleteHandler(options) {
  const {
    tableSelector,
    dataAttr,
    idKey,
    url,
  } = options;

  if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;
  const selectedItems = [];
  $(tableSelector + ` tbody input[type="checkbox"]:checked`).each(function() {
    const id_value = $(this).closest('tr').attr(dataAttr);
    if (id_value) {
      const item = {};
      item[idKey] = id_value;
      selectedItems.push(item);
    }
  });
  if (selectedItems.length === 0) return alert("selected object = 0.. retry");

  const msg = {
    successMsg: '삭제 되었습니다.',
    failedMsg: '삭제에 실패 하였습니다.'
  }

  $.ajax({
    url: url,
    type: 'DELETE',
    contentType: 'application/json',
    data: JSON.stringify(selectedItems),
    success: function() {
      sessionStorage.setItem('deleteResult', 'success');
      location.reload();
    },
    error: function() {
      loadToast('fail', msg);
    }
  });
}

$(document).ready(function() {
  viewDeleteToast();
  viewModifyToast();
});