<%@ page contentType="text/html; charset=utf-8" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">
                No
            </th>
            <th scope="col" class="px-6 py-3">
                Id
            </th>
            <th scope="col" class="px-6 py-3">
                Name
            </th>
            <th scope="col" class="px-6 py-3">
                Nickname
            </th>
            <th scope="col" class="px-6 py-3">
                Gender
            </th>
            <th scope="col" class="px-6 py-3">
                Email
            </th>
            <th scope="col" class="px-6 py-3">
                Phone
            </th>
            <th scope="col" class="px-6 py-3">
                Role
            </th>
            <th scope="col" class="px-6 py-3">
                Category
            </th>
            <th scope="col" class="px-6 py-3">
                RegDate
            </th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                ${users.no}
            </th>
            <td class="px-6 py-4">
                ${users.id}
            </td>
            <td class="px-6 py-4">
                ${users.name}
            </td>
            <td class="px-6 py-4">
                ${users.nickname}
            </td>
            <td class="px-6 py-4">
                ${users.gender}
            </td>
            <td class="px-6 py-4">
                ${users.email}
            </td>
            <td class="px-6 py-4">
                ${users.phone}
            </td>
            <td class="px-6 py-4">
                ${users.role}
            </td>
            <td class="px-6 py-4">
                ${users.category}
            </td>
            <td class="px-6 py-4">
                ${users.regDate}
            </td>
            <td class="px-6 py-4">
                <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>