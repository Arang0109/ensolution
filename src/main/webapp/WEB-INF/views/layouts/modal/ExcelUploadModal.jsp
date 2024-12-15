<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="excelUpload" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="excelUploadLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="excelUploadLabel">측정 항목 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div class="border p-4" style="background-color: white;">
            <div class="mb-3">
              <label for="formFile" class="form-label">Excel File Upload..</label>
              <input class="form-control" type="file" id="formFile">
            </div>
          </div>
        </div>
        <div class="container" style="padding-top: 1.875rem;">
          <div class="border p-4" style="background-color: white;">
            <p style="margin-left: 1.25rem;"><b>data list</b></p>
            <hr>
            <table class="table" id="editableTable">
              <thead>
              <tr>
                <th scope="col">시설명</th>
                <th scope="col">오염물질</th>
                <th scope="col">방지시설명</th>
                <th scope="col">허용 기준치</th>
                <th scope="col">측정 주기</th>
              </tr>
              </thead>
              <tbody id="tbody">

              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="excelUploadBtn" type="button" class="btn btn-primary" tabindex="-1">추가</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" tabindex="-1">닫기</button>
      </div>
    </div>
  </div>
</div>