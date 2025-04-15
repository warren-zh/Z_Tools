document.addEventListener("DOMContentLoaded", () => {
  const convertLinkBtn = document.getElementById("convertLinkBtn") as HTMLButtonElement;
  const openLinkBtn = document.getElementById("openLinkBtn") as HTMLButtonElement;
  const convertedLink = document.getElementById("convertedLink") as HTMLElement;
  const urlInput = document.getElementById("urlInput") as HTMLInputElement;

  convertLinkBtn.addEventListener("click", () => {
    const originalUrl = urlInput.value;
    const newUrl = convertMeetingUrl(originalUrl);

    if (newUrl) {
      convertedLink.textContent = newUrl;
      openLinkBtn.style.display = "block";
    } else {
      convertedLink.textContent = "Invalid URL";
      openLinkBtn.style.display = "none";
    }
  });

  openLinkBtn.addEventListener("click", () => {
    const url = convertedLink.textContent;
    if (url) {
      window.open(url, "_blank");
      window.close();
    }
  });
});

function convertMeetingUrl(url: string): string {
  if (!url) return "";
  return url
    .replace("https", "zoommtg")
    .replace(/j\//, "join?action=join&confno=")
    .replace("?pwd", "&pwd")
    .replace(/(pwd=[^&]*)(?:&.*)?/, (_, pwd) => {
      return `${pwd}&browser=chrome`;
    });
}
