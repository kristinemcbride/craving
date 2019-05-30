
const highlightStars = (event) => {
  const starDivs = document.querySelectorAll(".inline-form-checks .form-check");
  const targetDiv = event.currentTarget;
  const  targetValue = targetDiv.querySelector('input').value;
  [...starDivs].forEach((div) => {
    const star = div.querySelector('i');
    if (div.querySelector('input').value <= targetValue) {
      star.classList.remove('far');
      star.classList.add('fas');
    } else {
      star.classList.remove('fas');
      star.classList.add('far');
    }
  })
}

const animateStarReview = () => {
 const starIcons = document.querySelectorAll(".inline-form-checks .form-check");
 [...starIcons].forEach((star) => star.addEventListener('mouseenter', highlightStars));
}

export { animateStarReview }
