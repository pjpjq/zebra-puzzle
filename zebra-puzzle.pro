%% Puzzle constraints:
%% 1.	There are five houses.
%% 2.	The English man lives in the red house.
%% 3. 	The Swede has a dog.
%% 4. 	The Dane drinks tea.
%% 5. 	The green house is immediately to the left of the white house.
%% 6. 	They drink coffee in the green house.
%% 7. 	The man who smokes Pall Mall has birds.
%% 8. 	In the yellow house they smoke Dunhill.
%% 9. 	In the middle house they drink milk.
%% 10. 	The Norwegian lives in the first house.
%% 11. 	The man who smokes Blend lives in the house next to the house with cats.
%% 12. 	In a house next to the house where they have a horse, they smoke Dunhill.
%% 13.	The man who smokes Blue Master drinks beer.
%% 14. 	The German smokes Prince.
%% 15. 	The Norwegian lives next to the blue house.
%% 16. 	They drink water in a house next to the house where they smoke Blend.

left_of(L, R, St) :- append(_, [L, R|_], St).
next_to(A, B, St) :- left_of(A, B, St); left_of(B, A, St).

find_zebra(St, Zowner) :-
    houses on the street: house_i[nationality_i, color_i, pet_i, drink_i, smoke_i] % 5
    St = [[norwegian, _, _, _, _],                              % 10
         [_, _, _, _, _],
         [_, _, _, milk, _],                                    % 9
         [_, _, _, _, _],
         [_, _, _, _, _]],                                      % 1
    
    % add the rest constraints
    member([english, red, _, _, _], St),                        % 2
    member([swede, _, dog, _, _], St),                          % 3
    member([dane, _, _, tea, _], St),                           % 4
    left_of([_, green, _, _, _],[_, white, _, _, _], St),       % 5
    member([_, green, _, coffee, _], St),                       % 6
    member([_, _, birds, _, pallmall], St),                     % 7
    member([_, yellow, _, _, dunhill], St),                     % 8
    next_to([_, _, _, _, blend], [_, _, cat, _, _], St),        % 11 
    next_to([_, _, horse, _, _], [_, _, _, _, dunhill], St),    % 12   
    member([_, _, _, beer, bluemaster], St),                    % 13
    member([german, _, _, _, prince], St),                      % 14
    next_to([norwegian, _, _, _, _], [_, blue, _, _, _], St),   % 15
    next_to([_, _, _, water, _], [_, _, _, _, blend], St),      % 16
    
    % find the owner of zebra
    member([Zowner, _, zebra, _, _], St).
