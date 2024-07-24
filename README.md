# 40k Battlegrounds Front End
![WARHAMMER-40K][warhammer-40k]








![Ruby][ruby-image]
![Rails][rails-image]

## Development setup

The front-end of this project uses Ruby on Rails 7.1.3 


First, clone the repository to your computer

```sh
git clone https://github.com/turing40kconsultants/wh40k_Battlegrounds_fe
```

Next, install all of the Gems

```sh
bundle install
```

Create the necessary databases -

```sh
rails db:{create,migrate,seed}
```


Finally, start the development server

```sh
.
```

and open a web browser with URL `localhost:3000`. Keep in mind that the [back end of this application](https://github.com/turing40kconsultants/wh40k_Battlegrounds_be) must be running on `localhost:5000` for the front end to function correctly. For instructions on how to run the back-end server, see the [back end GitHub page](https://github.com/turing40kconsultants/wh40k_Battlegrounds_be).

Run the test suite to diagnose issues. Keep in mind that the back end must be set up correctly and serving on `localhost:5000` for these tests to pass -

```sh
bundle exec rspec
```


# Socials

Clyde Autin | [clydeautin](https://github.com/clydeautin) | clyde.autin@gmail.com | [LinkedIn](https://www.linkedin.com/in/clydeautin/)

Chee Lee | [cheeleertr](https://github.com/cheeleertr) | cheeleertr@gmail.com | [LinkedIn](https://www.linkedin.com/in/chee-lee-rtr/)

Luis Aparicio | [LuisAparicio14](https://github.com/luisaparicio14) | lfelipeaparicio2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/luis-aparicio14/)

Lance Butler | [LJ9332](https://github.com/LJ9332) | lancej2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/lance-butler-jr/)



[ruby-image]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[rails-image]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[warhammer-40k]: https://store.frontlinegaming.org/cdn/shop/collections/https___trade.games-workshop.com_assets_2023_07_15-07_Trade_Header_-_Librarian_in_Warded_Terminator_Armour_1.jpg?v=1692370043