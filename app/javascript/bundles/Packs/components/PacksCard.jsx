import React from "react";
import style from "./PacksCard.module.css";

const PacksCard = (props) => {
  console.log(props)
  return (
    <div className={style.container}>
      {props.map((pack) => (
        <h1>{pack.type}</h1>
      ))}
    </div>
  );
};

export default PacksCard;
