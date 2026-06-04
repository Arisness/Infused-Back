export class GroupManagement{
    async getAllGroups(data){
        try{
            const groupsData = await runQuery([[queries.group.getAllGroups, [data.userSession]]]);
            return groupsData.rows;
        }
        catch (error){
            logger.error(`Error fetching groups: ${error}`);
            return 'Internal server error during fetching groups.';
        }
    }

    async createGroup(data){
        try{
            await runQuery([[queries.group.createGroup, [data.name, data.userSession]]]);
            return 'Group created succesfully';
        }
        catch (error){
            logger.error(`Error creating group: ${error}`);
            return 'Internal server error during creating group.';
        }
    }

    async deleteGroup(data){
        try{
            await runQuery([
                [queries.groupRecipe.deleteRecipesFromGroup, [data.userSession, data.groupId]],
                [queries.group.deleteGroup, [data.groupId, data.userSession]]
            ]);
            return 'Group deleted succesfully';
        }
        catch (error){
            logger.error(`Error deleting group: ${error}`);
            return 'Internal server error during deleting group.';
        }
    }

    async updateGroup(data){
        try{
            await runQuery([[queries.group.updateGroup, [data.name, data.groupId, data.userSession]]]);
            return 'Group updated succesfully';
        } catch (error){
            logger.error(`Error updating group: ${error}`);
            return 'Internal server error during updating group.';
        }
    }

    //Relations
    async addRecipe(data){
        try{
            await runQuery([[queries.groupRecipe.addRecipeToGroup, [data.recipeId, data.groupId]]]);
            return 'Recipe added to group succesfully';
        } catch (error){
            logger.error(`Error adding recipe to group: ${error}`);
            return 'Internal server error during adding recipe to group.';
        }
    }

    async removeRecipe(data){
        try{
            await runQuery([[queries.groupRecipe.removeRecipeFromGroup, [data.recipeId, data.groupId]]]);
            return 'Recipe removed from group succesfully';
        } catch (error){
            logger.error(`Error removing recipe from group: ${error}`);
            return 'Internal server error during removing recipe from group.';
        }
    }

    async getRecipesForGroup(data){
        try{
            const recipesData = await runQuery([[queries.groupRecipe.getRecipesFromGroup, [data.groupId, data.userSession]]]);
            return recipesData.rows;
        } catch (error){
            logger.error(`Error fetching recipes from group: ${error}`);
            return 'Internal server error during fetching recipes from group.';
        }
    }

    async getImageFirstRecipe(data){
        try{
            const imageData = await runQuery([[queries.groupRecipe.getImageFirstRecipeFromGroup, [data.groupId, data.userSession]]]);
            return imageData.rows[0].recipe_image;
        } catch (error){
            logger.error(`Error fetching image of first recipe from group: ${error}`);
            return 'Internal server error during fetching image of first recipe from group.';
        }
    }
}