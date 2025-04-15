document.addEventListener("DOMContentLoaded", function () {
    var convertLinkBtn = document.getElementById("convertLinkBtn");
    var openLinkBtn = document.getElementById("openLinkBtn");
    var convertedLink = document.getElementById("convertedLink");
    var urlInput = document.getElementById("urlInput");
    convertLinkBtn.addEventListener("click", function () {
        var originalUrl = urlInput.value;
        var newUrl = convertMeetingUrl(originalUrl);
        if (newUrl) {
            convertedLink.textContent = newUrl;
            openLinkBtn.style.display = "block";
        }
        else {
            convertedLink.textContent = "Invalid URL";
            openLinkBtn.style.display = "none";
        }
    });
    openLinkBtn.addEventListener("click", function () {
        var url = convertedLink.textContent;
        if (url) {
            window.open(url, "_blank");
        }
    });
});
function convertMeetingUrl(url) {
    if (!url)
        return "";
    return url
        .replace("https", "zoommtg")
        .replace(/j\//, "join?action=join&confno=")
        .replace("?pwd", "&pwd")
        .replace(/(pwd=[^&]*)(?:&.*)?/, function (_, pwd) {
        return "".concat(pwd, "&browser=chrome");
    });
}
